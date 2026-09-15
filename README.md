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
| `writes-and-write-nots` | When to write it yourself: if the piece is where the thinking happens, do not delegate the draft |
| `politics-and-the-english-language` | Orwell's six rules and four vices, as an editing checklist |

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

Five of the skills are not voices. They are essays on writing turned into procedures: four by Paul Graham (`good-writing`, `write-like-you-talk`, `write-usefully`, `writes-and-write-nots`) and Orwell's `politics-and-the-english-language`, which is where the rest descend from. The PG ones also serve as the clearest examples of the `paul-graham` voice in action. `writes-and-write-nots` is the reason this repo exists and the rule for using it: writing is thinking, so write the draft yourself and use the voices to edit.

### Sources

The repo does not host the essays. Run this once after cloning and the agent can read the originals:

```bash
./scripts/fetch-sources.sh
```

It downloads the five essays from paulgraham.com and orwellfoundation.com into `sources/` (gitignored). Each guide skill points at its source file.

## What these are not

They are not collections of quotes and do not reproduce anyone's text. Each file describes patterns you can observe in public writing, with short illustrative fragments. If you want the real thing, read the source: the links are in each skill.

## Contributing

One voice per directory. Keep `SKILL.md` under 200 lines. Describe structure and habits, not vibes. Every claim about the voice should be something a reader could verify by reading the person.

## License

MIT
