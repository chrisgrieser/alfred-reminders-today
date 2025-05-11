# Alfred: Reminders Today
![Download count](https://img.shields.io/github/downloads/chrisgrieser/alfred-reminders-today/total?label=Total%20Downloads&style=plastic)
![Version number](https://img.shields.io/github/v/release/chrisgrieser/alfred-reminders-today?label=Latest%20Release&style=plastic)
<!-- ![Alfred gallery downloads](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fchrisgrieser%2F.config%2Frefs%2Fheads%2Fmain%2FAlfred.alfredpreferences%2Falfred-workflow-download-count.yaml&query=alfred-reminders-today&style=plastic&logo=alfred&label=Gallery%20Downloads&color=%235C1F87)-->

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
- Quickly add a new reminder due today or tomorrow with the keywords `qq`, `q1`,
  and `q2`, respectively.
	+ The command supports simple parsing of a due time with the format `hh:mm`.
	  For instance, `19:00 buy milk` or `buy milk 19:00` will set the due time
	  to `19:00` and the reminder title to `buy milk`. (Only times in the
	  24-hour time format are parsed.)
	+ A priority can be specified by adding the respective number of `!`. For
	  example, `buy milk!` or `!buy milk` will result in a reminder title `buy
	  milk` with a medium priority (`!` = low, `!!` = medium, `!!!` = high).
	+ Note that `!` and due time are only parsed when at the start or the end on
	  the input.

## Installation
[➡️ Download the latest release of this
workflow.](https://github.com/chrisgrieser/alfred-reminders-today/releases/latest)

## Limitations
Apple's `EventKit` API does not offer access to various Reminder features, which
is why this workflow cannot support the following features:

- The `URL` field of a reminder is not accessible, so only URLs in the title or
  notes are supported.
- A reminder's tags, attachments, and flag-status are not accessible.
- The macOS Reminders widget shown at the notification center or desktop do not
  update when reminders are added or changed via this workflow.

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
