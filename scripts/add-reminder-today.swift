#!/usr/bin/swift
import EventKit
import Foundation

let eventStore = EKEventStore()
let semaphore = DispatchSemaphore(value: 0)

let input = CommandLine.arguments[1]
let reminderList = ProcessInfo.processInfo.environment["reminder_list"]!
let when = ProcessInfo.processInfo.environment["when_to_add"]!

// ─────────────────────────────────────────────────────────────────────────────

struct ParsedResult {
	let hour: Int?
	let minute: Int?
	let message: String
}

func parseTimeAndMessage(from input: String) -> ParsedResult? {
	var msg = input.trimmingCharacters(in: .whitespacesAndNewlines)
	let pattern = #"(?<!\d)(\d{1,2}):(\d{1,2})(?!\d)"#
	let regex = try! NSRegularExpression(pattern: pattern)

	guard
		let match = regex.firstMatch(in: msg, range: NSRange(msg.startIndex..., in: msg))
	else {
		// No time found — use entire input as message if not empty
		return msg.isEmpty
			? nil : ParsedResult(hour: nil, minute: nil, message: msg)
	}

	guard
		let hrRange = Range(match.range(at: 1), in: msg),
		let minRange = Range(match.range(at: 2), in: msg),
		let timeRange = Range(match.range, in: msg),
		let hour = Int(msg[hrRange]),
		let minute = Int(msg[minRange]),
		(0..<24).contains(hour),
		(0..<60).contains(minute)
	else {
		return nil  // Invalid time
	}

	msg.removeSubrange(timeRange)
	msg = msg.trimmingCharacters(in: .whitespacesAndNewlines)

	return msg.isEmpty ? nil : ParsedResult(hour: hour, minute: minute, message: msg)
}

// ─────────────────────────────────────────────────────────────────────────────

eventStore.requestFullAccessToReminders { granted, error in
	if let error = error {
		print("❌ Error requesting access: \(error.localizedDescription)")
		semaphore.signal()
		return
	}
	guard granted else {
		print("❌ Access to Reminders not granted.")
		semaphore.signal()
		return
	}
	// ──────────────────────────────────────────────────────────────────────────

	// Create a new reminder
	let parsed = parseTimeAndMessage(from: input)
	guard parsed != nil else {
		print("❌ Invalid input: '\(input)'")
		semaphore.signal()
		return
	}
	let (title, hh, mm) = (parsed!.message, parsed!.hour, parsed!.minute)
	let reminder = EKReminder(eventStore: eventStore)
	reminder.title = title
	reminder.isCompleted = false

	// determine day when to add
	let calendar = Calendar.current
	let today = Date()
	var dayToUse: Date
	if when == "today" {
		dayToUse = today
	} else if when == "tomorrow" {
		let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
		dayToUse = tomorrow
	} else {
		print("❌ Invalid value for 'when_to_add' environment variable.")
		semaphore.signal()
		return
	}

	// Set due date (If hour and minute are nil, it is an all-day reminder)
	var dateComponents = calendar.dateComponents([.year, .month, .day], from: dayToUse)
	dateComponents.hour = hh
	dateComponents.minute = mm
	reminder.dueDateComponents = dateComponents

	// Find the calendar (list) by name
	if let calendarList = eventStore.calendars(for: .reminder).first(where: {
		$0.title == reminderList
	}) {
		reminder.calendar = calendarList
	} else {
		print("❌ No calendar found with the name \"\(reminderList)\".")
		semaphore.signal()
		return
	}

	// Save
	do {
		try eventStore.save(reminder, commit: true)
		var alfredNotif = title
		if hh != nil {
			let minutePadded = String(format: "%02d", mm!)
			alfredNotif = "\(hh!):\(minutePadded) — \(title)"
		}
		print(alfredNotif)
	} catch {
		print("❌ Failed to create reminder: \(error.localizedDescription)")
	}

	semaphore.signal()
}

_ = semaphore.wait(timeout: .distantFuture)
