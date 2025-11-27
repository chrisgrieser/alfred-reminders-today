# Alfred: Reminders Today
![GitHub downloads](https://img.shields.io/github/downloads/chrisgrieser/alfred-reminders-today/total?label=GitHub%20Downloads&style=plastic&logo=github)
![Alfred Gallery downloads](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fchrisgrieser%2F.config%2Frefs%2Fheads%2Fmain%2FAlfred.alfredpreferences%2Falfred-gallery-downloads.yaml&query=reminders-today&style=plastic&logo=alfred&label=Gallery%20Downloads&color=%235C1F87)
![Version number](https://img.shields.io/github/v/release/chrisgrieser/alfred-reminders-today?label=Latest%20Release&style=plastic)

Display and add reminders due today.

<img alt="Showcase" width=70% src="https://github.com/user-attachments/assets/627ef6de-8fe9-4710-8352-2c63e4be5e67">

## Usage
- Display reminders due today (or overdue) via the keyword `rem`. Configure the
  [hotkey](https://www.alfredapp.com/help/workflows/triggers/hotkey/) for faster
  triggering.
	+ <kbd>⏎</kbd>: Complete the reminder.
	+ <kbd>⌘⏎</kbd>: If the reminder has a URL in title or notes, open it in the
	  default browser. Otherwise, copy the reminder's title & notes to the
	  clipboard. Afterward, complete the reminder.
	+ <kbd>⇧⏎</kbd>: "Snooze" the reminder by changing its due date to tomorrow.
	+ <kbd>⌥⏎</kbd>: Edit the reminders title and body in Alfred's Text View.
	  The first line is the reminder's title, the remaining lines the notes.
	+ <kbd>⌃⏎</kbd>: Display completed reminders due today as well. Using
	  <kbd>⏎</kbd> on a completed reminder marks it as uncompleted. The other
	  modifiers work the same as with uncompleted reminders. Use <kbd>⌃⏎</kbd>
	  once more to hide completed reminders again.
	+ <kbd>⌘C</kbd>: Copy the reminder title & notes.
	+ <kbd>⌘L</kbd>: Display the reminder details in Large Type.
	+ <kbd>⌘Y</kbd>: Quick Look the URL, if there is one.
	+ <kbd>⏎</kbd> *(on an event)*: If the location is a URL, open the URL.
	  Otherwise, open Google Maps with the location.
- Quickly add a new reminder due today the keyword `qq`.
	+ The command supports simple parsing of a due time with the format `hh:mm`
	  or `hh.mm` at the start or end of the input.
		* For instance, `19:00 buy milk` or `buy milk 19.00` will set the due
		  time to `19:00` and the reminder title to `buy milk`.
		* 12-hour time like `buy milk 3:00pm` or `buy milk 3pm` is also
		  supported.
		* Alternative, you can specify a relative time like `buy milk in 2h` or
		  `in 2 minutes buy milk`.
	+ A priority can be specified by adding the respective number of `!` at the
	  start of end. For example, `buy milk!!` or `!!buy milk` will result in a
	  reminder title `buy milk` with a medium priority (`!` = low, `!!` =
	  medium, `!!!` = high).
	+ Use `q1` create the reminder tomorrow, `q2` for the day after tomorrow,
	  and `qm` for next Monday. All keywords are configurable.
	+ If the input is a bare URL, will move the URL to the reminder body and
	  fetch the reminder title from the URL.
	+ Configure the
	  [hotkey](https://www.alfredapp.com/help/workflows/triggers/hotkey/) to
	  create a reminder due today from the current selection.

## Installation
**Requirements**
- macOS 15 (Sequoia) or higher
- Xcode command line tools. (Alfred [automatically prompts you to install
  them](https://www.alfredapp.com/help/kb/dependencies/), if they are not
  available on your device.)

[➡️ Download the latest release of this
workflow.](https://github.com/chrisgrieser/alfred-reminders-today/releases/latest)

## Limitations
Apple's `EventKit` API does not offer access to various Reminder metadata, which
is why this workflow cannot support the following features:
- The `URL` field of a reminder is not accessible, so only URLs in the title or
  notes are supported.
- A reminder's tags, attachments, and flag-status are not accessible.
- The macOS Reminders widget shown at the notification center or desktop do not
  update when reminders are added or changed via this workflow.

## iOS Shortcut for creating new task
You can use this shortcut to create a new task for today due today. Use it in
the Share Sheet or simply run it from the Lock Screen or Control Center.
[➡️ Download the shortcut](https://raw.githubusercontent.com/chrisgrieser/alfred-reminders-today/blob/main/Task%20for%20today.shortcut)

## About the developer
In my day job, I am a sociologist studying the social mechanisms underlying the
digital economy. For my PhD project, I investigate the governance of the app
economy and how software ecosystems manage the tension between innovation and
compatibility. If you are interested in this subject, feel free to get in touch.

- [Website](https://chris-grieser.de/)
- [Mastodon](https://pkm.social/@pseudometa)
- [ResearchGate](https://www.researchgate.net/profile/Christopher-Grieser)
- [LinkedIn](https://www.linkedin.com/in/christopher-grieser-ba693b17a/)

<a href='https://ko-fi.com/Y8Y86SQ91' target='_blank'> <img height='36'
style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3'
border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
