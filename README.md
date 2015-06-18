# PAT-recorder
Templates and scripts for Portable Appliance Test records.

The plan is that there will be a template spreadsheet in 'sc' format that contains the header part and frames.
There possibly will also need to be macros included in this template.

Once the data is ready to export, there are three parts to be handled separately and these are marked by named regions in the spreadsheet. The three parts are title, header and main data.

Each of these is exported separately in a format yet to be decided. Likely candidates are tbl and latex. They need to be separate to keep the cell width calculations sane (or pretty, depending on your inner poet).

Regardless of the format, the result from 'sc' is a code snippet in each case and the three snippets can simply be concatenated to create a larger document.

The output of 'sc' is not quite as we need so further processing is required: specifically, all the cells come out as centred or number aligned when we really want them all left-justified.

Once the tbl or latex file is ready, it can be processed with groff or another text processing system to create the PDF.

In the diagram below, the extension 'tbl' could instead be 'lat'.

```
                    +----------------+
                    | PAT results.sc |
                    +----------------+
                            |
        +-------------------+----------------------+  Three sepeate uses of 'T' command in 'sc'.
        |                   |                      |
+---------------+   +----------------+   +-------------------+
| PAT title.tbl |   | PAT header.tbl |   | PAT main_data.tbl |
+---------------+   +----------------+   +-------------------+
                            |
                            | Concatenate
                            |
                    +---------------+
                    | PAT whole.tbl |
                    +---------------+
                            |
                            | Transform cell alignemnt to left-justified.
                            |
                    +---------------+
                    | PAT whole.tbl |
                    +---------------+
                            |
                            | Process with groff or similar.
                            |
                    +---------------+
                    | PAT whole.pdf |
                    +---------------+
```
