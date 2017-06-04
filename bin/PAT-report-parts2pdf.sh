cat PAT-part-title.tbl PAT-part-header.tbl PAT-part-main_data.tbl > PAT-whole.tbl
PAT-tbltidy.sh PAT-whole.tbl > PAT-whole-tidy.tbl
PAT-report-tbl2pdf PAT-whole-tidy.tbl
