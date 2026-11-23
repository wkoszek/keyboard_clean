# clean_keyboard 🧽⌨️

Lock your Mac keyboard so you can wipe it without typing junk.
The mouse and trackpad keep working.

## Setup

```sh
pip3 install pyobjc-framework-Quartz
```

Then give your terminal app Accessibility access in System Settings >
Privacy & Security > Accessibility. Quit and reopen the terminal.

## Use

```sh
./clean_keyboard       # lock for 60 seconds
./clean_keyboard 30    # lock for 30 seconds
```

It blocks typing plus the volume and brightness keys. A countdown shows
the time left. 🕐

## Heads up ⚠️

- The power button and Touch ID still work. Wipe around them.
- Ctrl-C won't stop it, since the keyboard is locked. To quit early,
  close the terminal window with the mouse. Confirm any prompt
  to stop the process.
