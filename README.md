# skills

Agent skills for Claude Code and any other skills-compatible agent.

Each skill is a folder under `skills/` with a `SKILL.md`. This README groups them by topic.

## Writing voices

Each voice skill is a study of how one person writes: sentence shape, what they lead with, what they never say, how they handle uncertainty, how they end. Use them to draft in that voice, or read them to learn what makes each writer work.

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
| `patrick-mckenzie` | How a financial or business system really works, for a smart outsider |
| `julia-evans` | Explaining a technical thing you just figured out, without condescension |
| `dan-luu` | Testing a common belief against measurement; data-first, dry |
| `scott-alexander` | Long essays that steelman every side before choosing |
| `bryan-caplan` | Short combative arguments with a bet attached |
| `ben-thompson` | Strategic analysis of a tech move through named frameworks |
| `jeff-bezos` | Principles stated plainly with one concrete example each; memos and letters |
| `warren-buffett` | A business explained to a smart non-financial reader, with arithmetic and jokes |
| `hemingway` | Short sentences, concrete nouns, emotion shown not named |
| `richard-feynman` | Explaining something hard to a smart beginner without lying |
| `lesswrong` | The forum house style: epistemic status, probabilities, cruxes, argument over person |
| `caveman` | No articles, no tenses, two-to-five-word grunts; a joke and an editing test |
| `pirate` | Arr. For release notes, birthdays, and September 19 |
| `corporate` | Banking, consulting, and sales register; parody, and a hunt list for your own drafts |
| `good-writing` | Revise by ear; PG's argument that prose which sounds right is more likely to be right |
| `write-like-you-talk` | Replace the written register with what you would actually say to a friend |
| `write-usefully` | PG's test for an essay: important, novel, correct, strong, precisely qualified |
| `writes-and-write-nots` | When to write it yourself: if the piece is where the thinking happens, do not delegate the draft |
| `politics-and-the-english-language` | Orwell's six rules and four vices, as an editing checklist |

## Apple on macOS

| Skill | Best for |
|---|---|
| `apple-notes` | Reading, editing, tagging, and creating Apple Notes from the terminal, including notes with real headings via Shortcuts |
| `apple-reminders` | Adding, editing, completing, and deleting Apple Reminders with `reminders-cli` |

## Install

```bash
npx skills add ricardostmalo/skills
```

Or copy any `skills/<name>/SKILL.md` into your project's `.claude/skills/` or `.agents/skills/`.

## Usage

Invoke the skill and give it what to write:

```
/sam-altman  Write a one-paragraph answer to "what are you looking for in your next role?"
```

## Notes on the writing skills

Five of the skills are not voices. They are essays on writing turned into procedures: four by Paul Graham (`good-writing`, `write-like-you-talk`, `write-usefully`, `writes-and-write-nots`) and Orwell's `politics-and-the-english-language`, which is where the rest descend from. The PG ones also serve as the clearest examples of the `paul-graham` voice in action. `writes-and-write-nots` is the reason this repo exists and the rule for using it: writing is thinking, so write the draft yourself and use the voices to edit.

### Sources

The repo does not host the essays. Run this once after cloning and the agent can read the originals:

```bash
./scripts/fetch-sources.sh
```

It downloads the five essays from paulgraham.com and orwellfoundation.com into `sources/` (gitignored). Each guide skill points at its source file.

## What the voices are not

They are not collections of quotes and do not reproduce anyone's text. Each file describes patterns you can observe in public writing, with short illustrative fragments. If you want the real thing, read the source: the links are in each skill.

## Contributing

One skill per directory. For voices, keep `SKILL.md` under 200 lines. Describe structure and habits, not vibes. Every claim about the voice should be something a reader could verify by reading the person.

## License

MIT
