% README for PAT-rocrder project.
% Ian Cheesbrough, Artistek

# PAT-recorder
Templates and scripts for Portable Appliance Test records.

The plan is that there will be a template spreadsheet in `sc` format that contains the header part and frames.
There possibly will also need to be macros included in this template.

Once the data is ready to export, there are three parts to be handled separately and these are marked by named regions in the spreadsheet. The three parts are title, header and main data.

Each of these is exported separately in `tbl` format. They need to be separate to keep the cell width calculations sane (or pretty, depending on your inner poet).

The result from `sc` is a code snippet in each case and the three snippets can simply be concatenated to create a larger document.

The output of `sc` is not quite as we need so further processing is required: specifically, all the cells come out as centred or number aligned when we really want them all left-justified.

Once the tbl file is ready, it can be processed with groff or another text processing system to create the PDF.


```
                    +----------------+
                    | PAT results.sc |
                    +----------------+
                            |
        +-------------------+----------------------+  (1) Three separate uses of `T` command in `sc`.
        |                   |                      |
+---------------+   +----------------+   +-------------------+
| PAT title.tbl |   | PAT header.tbl |   | PAT main_data.tbl |
+---------------+   +----------------+   +-------------------+
        |                   |                      |
        +-------------------+----------------------+  (2) Concatenate
                            |
                    +---------------+
                    | PAT whole.tbl |
                    +---------------+
                            |
                            | (3) Transform cell alignment to left-justified.
                            |
                  +--------------------+
                  | PAT whole tidy.tbl |
                  +--------------------+
                            |
                            | (4) Process with `groff` or similar.
                            |
                    +---------------+
                    | PAT whole.pdf |
                    +---------------+
```

The transformatoins are numbered 1-4 in the above diagram. 


Transformation   Script or Program        Description
---------------  ------------------       ------------
1                export-parts.sc          Macro file for `sc` to export the ranges that define the parts.
1                PAT-export-parts.sh      Calls `sc` to run above macro file non-interactively.
2                (None)                   Contained within a wrapper with wider scope.
3                PAT-tbltidy.sh           Calls `sed` to remove redundant spaces and convert number alignment to left-alignment.
4                PAT-report-tbl2pdf.sh    Calls `groff` to create final PDF.
2-4              PAT-report-parts2pdf.sh  Issues `cat` to achieve (2) and calls the other scripts for their respective roles.
1-4              ??                       *VapourWare* Calls each of the above scripts.
