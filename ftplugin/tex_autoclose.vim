" Vim Tex / LaTeX ftplugin to automatically close environments.
" Maintainor:	Gautam Iyer <gautam@math.uchicago.edu>
" Created:	Mon 23 Feb 2004 04:47:53 PM CST
" Last Changed:	Mon 23 Feb 2004 05:57:05 PM CST

" provide load control
if exists('b:loaded_tex_autoclose')
    finish
endif

let b:loaded_tex_autoclose = 1

" If the user has mapped "TexCloseEnv" to something, we assume he does not
" want our maps, and we do not provide any mappings.
if !hasmapto("TexCloseEnv()", "ni")
    inoremap <buffer>		<leader>}  }
    inoremap <buffer> <silent>	}	   }<esc>:call TexCloseEnv()<cr>
endif

" If the cursor is at the end of a "\begin{environment}", then generate the
" corresponding "\end{environment}" and put it on the next line. Leave the
" cursor (in insert mode) at the end of "\begin{environment}" so the user can
" enter agruements (if any).
function TexCloseEnv()
    let line = getline('.')
    let linestart = strpart( line, 0, col('.'))

    let env = matchstr( linestart, '\v%(\\begin\{)@<=[a-zA-Z0-9*]+%(\}$)@=')
    if env != ''
	exec "normal! a\<cr>\\end{" . env . "}\<esc>k"
	startinsert!
    else
	" Not a begin tag. Resume insert mode as if nothing had happened
	if col('.') < strlen(line)
	    normal! l
	    startinsert
	else
	    startinsert!
	endif
    endif
endfunction
