---
name: apple-reminders
description: Read, add, edit, complete, and delete Apple Reminders from the terminal on a Mac with reminders-cli. Use for any reminder or to-do with a due date.
---

# Apple Reminders

Use `reminders` (reminders-cli, installed with
`brew install keith/formulae/reminders-cli`). It talks to Reminders through
EventKit, the native API, so it is faster and more reliable than AppleScript.
memo's `rem` command is interactive; do not use it. Verified on macOS in September 2026.

## Commands

```sh
reminders show-lists                        # list names
reminders show Reminders                    # open items with index numbers
reminders show Reminders --format json      # includes externalId, dueDate, notes, priority
reminders show-all                          # every list
reminders add Reminders "Pay card" --due-date "tomorrow 9am" --priority high --notes "details"
reminders edit Reminders <index|id> "New text" --notes "new note"
reminders complete Reminders <index|id>
reminders delete Reminders <index|id>
```

## Rules

- Prefer the `externalId` from `--format json` over the index. Indexes shift
  when items are added or completed.
- `--due-date` accepts natural language ("tomorrow 9am", "friday",
  "2026-10-19 10:00"). Times are local; JSON shows UTC.
- `complete` and `delete` only find open items. To delete a completed item,
  `uncomplete` it first (by its index in `--only-completed`), then delete it.
- `delete` is permanent. Ask before deleting a reminder the user created.
- Adding or completing a reminder at the user's request needs no extra confirmation.
