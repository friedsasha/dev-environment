setlocal ts=4 sw=4 expandtab sts=4
setlocal nospell

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

inoremap <buffer> ZL <Esc>:exec ("normal " . (80 - virtcol(".")) . "a#")<CR>a

" Indent python in the google way.

setlocal indentexpr=getgooglepythonindent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
