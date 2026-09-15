# voices

Agent skills that make Claude Code (or any skills-compatible agent) write in the voice of a specific communicator.

Each skill is a study of how one person writes: sentence shape, what they lead with, what they never say, how they handle uncertainty, how they end. Use them to draft in that voice, or read them to learn what makes each writer work.

## Voices

| Skill | Best for |
|---|---|
| `paul-graham` | Essays that build one idea from a concrete observation |
| `sam-altman` | Short, declarative, ambitious; memos and personal statements |
| `dario-amodei` | Long-form argument with explicit uncertainty and structure |
| `claude` | Careful, warm, precise; explaining without overclaiming |
| `chatgpt` | Friendly, structured, accessible; the default assistant register |
| `dwarkesh-patel` | Questions that drive at the crux; interview prep and probing |
| `eliezer-yudkowsky` | Rigor about reasoning itself; dense, parenthetical, exact |
| `gwern-branwen` | Exhaustive, footnoted, skeptical; long research writeups |
| `good-writing` | Revise by ear; PG's argument that prose which sounds right is more likely to be right |
| `write-like-you-talk` | Replace the written register with what you would actually say to a friend |
| `write-usefully` | PG's test for an essay: important, novel, correct, strong, precisely qualified |

## Install

```bash
npx skills add ricardostmalo/voices
```

Or copy any `skills/<name>/SKILL.md` into your project's `.claude/skills/` or `.agents/skills/`.

## Usage

Invoke the skill and give it what to write:

```
/sam-altman  Write a one-paragraph answer to "what are you looking for in your next role?"
```

## On writing itself

Three of the skills are not voices. They are Paul Graham's own guides to writing, turned into procedures: `good-writing`, `write-like-you-talk`, `write-usefully`. They also serve as the clearest examples of the `paul-graham` voice in action. His essay "Writes and Write-Nots" (paulgraham.com/writes.html) is the reason this repo exists: writing is thinking, and the people who keep doing it by hand will be the ones who can still think.

## What these are not

They are not collections of quotes and do not reproduce anyone's text. Each file describes patterns you can observe in public writing, with short illustrative fragments. If you want the real thing, read the source: the links are in each skill.

## Contributing

One voice per directory. Keep `SKILL.md` under 200 lines. Describe structure and habits, not vibes. Every claim about the voice should be something a reader could verify by reading the person.

## License

MIT
