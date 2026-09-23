---
name: apple-notes
description: Read, create, edit, tag, move, and delete Apple Notes from the terminal on a Mac. Use for any Apple Notes task: splitting or reorganizing notes, adding tags, creating notes with real headings, reading voice-note recordings, or deciding between osascript, memo, the Apple Notes MCP connector, and Shortcuts.
---

# Apple Notes

Everything here was verified on macOS in September 2026.

## Which tool for which job

| Job | Use |
| --- | --- |
| List, read, edit, move, delete | `osascript`, addressing notes by `note id` |
| Create a note with real title, headings, lists | `scripts/markdown-note.sh` |
| Add a tag (new or existing) | `scripts/tag-note.sh` |
| Read a note as clean Markdown | `memo notes -v N` (`memo notes -nc` to list fresh) |
| Export all notes | `memo notes -ex` |
| Smart folders | Not possible. The user creates them in the UI |

Do not use the "Read and Write Apple Notes" MCP connector. It only works by
note name, and "first note whose name is X" often hits a copy in Recently
Deleted, which cannot be modified.

## osascript basics

List notes with ids and folders (loop over folders; `container of note` fails):

```sh
osascript <<'EOF'
tell application "Notes"
  set out to ""
  repeat with f in folders
    repeat with n in notes of f
      set out to out & (id of n) & " | " & (name of n) & " | " & (name of f) & linefeed
    end repeat
  end repeat
  return out
end tell
EOF
```

The default folder is named `Notes` in AppleScript even though the UI shows
"Notas" in a Spanish-language system. Read with `body of note id "..."` (HTML) or `plaintext of note id "..."`.
Delete with `delete note id "..."`; the note goes to Recently Deleted for 30 days.

## Writing rules

- `set body` replaces the whole note. It **deletes images and attachments**
  unless their markup is kept. Appending (`set body of n to (body of n) & "..."`)
  keeps them. Check `count of attachments of n` before rewriting.
- `set body` takes HTML but **imitates** styles: `<h1>`, `<h2>`, `<h3>` become
  bold Body text at 24/18/normal px, not Notes' Title/Heading styles. memo and
  the MCP connector have the same limit because they also use `set body`.
  For real styles, create the note with `scripts/markdown-note.sh`.
- Keep HTML on one line inside AppleScript strings.
- Writing `#tag` text never creates a tag, with or without a trailing space,
  through osascript, the MCP, memo, or Shortcuts "Append to Note".

## Scripts

```sh
scripts/markdown-note.sh note.md       # or pipe Markdown on stdin
scripts/tag-note.sh "Groceries" "home"
```

`markdown-note.sh` runs the "Markdown Note" shortcut: Notes' native
Create Note action with Interpret as Markdown, so Notes renders `#`, `##`,
lists, and bold with its real styles. `tag-note.sh` runs "Tag Note": Create
Tag, then Add Tags to Notes on the note with that exact name. Both write their
JSON input under `~/Library/Caches/`, because Shortcuts cannot read
`/var/folders` temp files. When a run hangs, a Shortcuts dialog is waiting on
the user's screen: ask them what it says.

## Installing the shortcuts (once per Mac)

Sources are in `shortcuts/`. For each:

```sh
plutil -convert binary1 -o /tmp/x.shortcut shortcuts/markdown-note.plist
shortcuts sign --mode anyone --input /tmp/x.shortcut --output "Markdown Note.shortcut"
open "Markdown Note.shortcut"   # then click "Add Shortcut"
```

The shortcut name must match the one in the script. The first run asks for
permission; answer "Always Allow".

## Building Shortcuts actions: lessons

- Notes' App Intents are listed in
  `/System/Applications/Notes.app/Contents/Resources/Metadata.appintents/extract.actionsdata`.
  Use the intent, not text tricks.
- Plist parameter keys are usually the intent's parameter names (`notes`,
  `tags`, `name`), but Create Note's text field is the legacy key
  `WFCreateNoteInput`, not `contents`. When a field shows empty in the editor,
  ask the user to type a word in it, then read how Shortcuts stored it from a
  copy of `~/Library/Shortcuts/Shortcuts.sqlite` plus its `-wal`
  (`ZSHORTCUTACTIONS.ZDATA` is a binary plist).
- End with `is.workflow.actions.nothing` so the CLI run does not ask
  permission to output the result.
- Computer use can only click in Shortcuts, not type or paste.
- `shortcuts` has no delete command. Delete shortcuts in the app.

## Voice notes

Recordings are attachments named `recording.m4a`. The files live under
`~/Library/Group Containers/group.com.apple.notes/Accounts/<id>/Media/`.
Notes' own transcript is not readable from AppleScript. To transcribe, use a
local Whisper model or an API, and ask the user which.
