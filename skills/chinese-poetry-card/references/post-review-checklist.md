# Post-generation review checklist

Review in posting order: cover → poem → poet → background → idiom.

## Content and accuracy

- [ ] Five images exist and filenames show their order and role.
- [ ] The cover follows the reference cover layout and contains only approved series text.
- [ ] The poem is complete, correctly ordered, and uses the intended edition.
- [ ] The poem meaning is plain language and does not repeat background research.
- [ ] The poet card is one integrated introduction with dates, one memorable sourced distinction, and a brief style note; no duplicate title.
- [ ] The background card contains unique, non-obvious, source-supported context.
- [ ] The idiom is concrete or clearly illustrated, correct, and usable by a 4–8-year-old child.
- [ ] All names, dates, place names, quotations, punctuation, simplified forms, and brand text are correct.

## Series and visual quality

- [ ] All five PNGs have the same exact pixel dimensions and 3:4 ratio.
- [ ] The same ornate border, bottom scroll, feather mark, typography hierarchy, and 羽言课堂 placement appear on all five cards; any poem-specific palette shift remains restrained and series-compatible.
- [ ] The cover and first three cards use the same new poet identity and connected historical world.
- [ ] The new poet is not an accidental copy of Zhao Shixiu; poem-specific decoration is not copied from the reference set.
- [ ] The idiom card is modern, calm, printable, and still compatible with the series.
- [ ] Text is legible; no duplicate headings, malformed characters, English, watermark, or unrelated object appears.

## Text gate

- [ ] OCR exact comparison passed where macOS Vision is available.
- [ ] No observed text is below the minimum confidence threshold.
- [ ] Every visible Chinese character was manually compared with the UTF-8 source record.
- [ ] Any unclear character was treated as a failure and regenerated.

The five final cards must be directly in a poet-and-poem directory under outputs/诗歌学习卡/, named <诗人>_<诗歌题目>/. Report five absolute paths. Keep A4 and video exports outside the core five-card directory.
