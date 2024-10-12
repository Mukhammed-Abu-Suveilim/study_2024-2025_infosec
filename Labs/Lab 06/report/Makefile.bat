@echo off
setlocal

rem Define variables
set FILTERS=--filter C:\Users\Mo\pandoc-crossref
set OPTIONS=--number-sections
set PDF_ENGINE=--pdf-engine=lualatex --pdf-engine-opt=--shell-escape
set BIB_OPTIONS=--citeproc
set PDF_BIB_OPTIONS=--citeproc

rem Get list of markdown files
for %%f in (*.md) do (
    set "FILES=%%~nf.docx %%~nf.pdf !FILES!"
)

rem Function to convert md to docx
:convert_md_to_docx
for %%f in (*.md) do (
    pandoc "%%f" %FILTERS% %OPTIONS% %BIB_OPTIONS% -o "%%~nf.docx"
)
goto :eof

rem Function to convert md to pdf
:convert_md_to_pdf
for %%f in (*.md) do (
    pandoc "%%f" %FILTERS% %PDF_ENGINE% %PDF_BIB_OPTIONS% %OPTIONS% -o "%%~nf.pdf"
)
goto :eof

rem Build all targets
:all
call :convert_md_to_docx
call :convert_md_to_pdf
goto :eof

rem Clean up generated files
:clean
for %%f in (*.docx *.pdf *~) do (
    del "%%f"
)
goto :eof

rem Clean all
:cleanall
call :clean
goto :eof

rem Execute the all target by default
call :all

endlocal