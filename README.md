# Alfred: Reminders Today
![Download count](https://img.shields.io/github/downloads/chrisgrieser/alfred-reminders-today/total?label=Total%20Downloads&style=plastic)
![Version number](https://img.shields.io/github/v/release/chrisgrieser/alfred-reminders-today?label=Latest%20Release&style=plastic)

Display and edit reminders due today.

<img alt="Showcase" width=70% src="https://github.com/user-attachments/assets/627ef6de-8fe9-4710-8352-2c63e4be5e67">

## Info on version 2.0
Due to the underlying tool (`reminder-cli`) being abandoned, I rewrote this
workflow to work fully standalone. This has the drawback that adding from
selection/browser tabs and editing reminders features had to be removed.

Note that this workflow now **requires at least macOS 14**.

On the upside, this workflow now does not require `reminders-cli` anymore, so
you can uninstall it:

```bash
brew uninstall keith/formulae/reminders-cli
brew untap keith/formulae
```

## Usage
- Display reminders due today (or overdue) via the keyword `rem`. Configure the
  [hotkey](https://www.alfredapp.com/help/workflows/triggers/hotkey/) for faster
  triggering.
	+ <kbd>⏎</kbd>: Complete the reminder.
	+ <kbd>⌘⏎</kbd>: If the reminder has a URL, open it in the default browser,
	  otherwise, copy the reminder's text to the clipboard. Afterward, complete
	  the reminder.
	+ <kbd>⇧⏎</kbd>: "Snooze" the reminder by changing its due date to tomorrow.
	+ <kbd>⌃⏎</kbd>: Display completed reminders due today as well. Using
	  <kbd>⏎</kbd> on a completed reminder marks it as uncompleted. The other
	  modifiers work the same as with uncompleted reminders. Use <kbd>⌃⏎</kbd>
	  once more to hide completed reminders again.
	+ <kbd>⌘C</kbd>: Copy the reminder details (title, notes, URL).
	+ <kbd>⌘L</kbd>: Display the reminder details in Large Type.
- Quickly add a new reminder due today or tomorrow with the keywords `qq` and
  `qqq`, respectively.

[➡️ Download the latest release of this
workflow.](https://github.com/chrisgrieser/alfred-reminders-today/releases/latest)

## Credits
Icon by [Emoopo-Design](https://macosicons.com/#/u/Emoopo-Design)

## About the developer
In my day job, I am a sociologist studying the social mechanisms underlying the
digital economy. For my PhD project, I investigate the governance of the app
economy and how software ecosystems manage the tension between innovation and
compatibility. If you are interested in this subject, feel free to get in touch.

- [Academic website](https://chris-grieser.de/)
- [Mastodon](https://pkm.social/@pseudometa)
- [ResearchGate](https://www.researchgate.net/profile/Christopher-Grieser)
- [LinkedIn](https://www.linkedin.com/in/christopher-grieser-ba693b17a/)

<a href='https://ko-fi.com/Y8Y86SQ91' target='_blank'> <img height='36'
style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3'
border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
