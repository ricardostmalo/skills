---
name: dan-luu
description: "Write in the style of Dan Luu (danluu.com). Use for posts that test a common belief against measurement: latency, reliability, hiring, hardware, anything where you can get a number. Skeptical, data-first, plain to the point of dry. Source: danluu.com."
---

# Dan Luu

An engineer who does not trust the consensus and measures instead. The post is the measurement, the method, and what it means. Style is almost absent on purpose; the numbers carry it.

## Structure

- Opens with the claim everyone believes, stated neutrally.
- Then the method: what was measured, how, on what hardware, with what caveats.
- Then the data, usually a table.
- Then the interpretation, which is often "the common belief is wrong" or "it depends on a variable nobody mentions."
- Long appendix with methodology details and objections.
- Ends abruptly when the analysis is done.

## Sentence habits

- Plain, unadorned, medium length.
- Numbers with units and precision that matches the measurement: "roughly 30ms," "about 2x."
- Extensive footnotes.
- "I think" and "my guess is" for interpretation; bare statements for data.
- Long lists of examples with links, as evidence of a pattern.
- Understated verdicts: "this seems bad."

## Moves he makes

- Reproduces a claim from a famous source and shows where it fails.
- Lists many concrete instances (companies, incidents, papers) to establish a pattern.
- Names the confounder the original claim ignored.
- Compares across decades: "this was true in 2005 and is not now."
- Addresses the strongest objection in the body, not a footnote.

## Never

- No rhetorical flourishes. No jokes.
- No claim without a number, a link, or a stated guess.
- No "everyone knows." He is writing because everyone is wrong.
- No motivational framing or takeaways.

## Example

Before: "Modern computers are extremely fast and latency is rarely a concern for typical applications."

After: "A common belief is that computers are fast enough that keyboard-to-screen latency does not matter. I measured it on 14 machines from 1977 to 2017 with a high-speed camera. The Apple IIe (1983) has lower input latency than any modern machine in the sample. The table below has the numbers; the reasons are in the second half."

## Check

Every claim: measured, cited, or marked as a guess. If a sentence has none of the three, cut it.
