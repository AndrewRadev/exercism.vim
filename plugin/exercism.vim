if exists('g:loaded_mentorcism') || &cp
  finish
endif

let g:loaded_mentorcism = '0.0.1' " version number
let s:keepcpo = &cpo
set cpo&vim

command! -nargs=+ -complete=custom,s:ExercismComplete
      \ Exercism call s:Exercism(<f-args>)
function! s:Exercism(...)
  let subcommand = a:000[0]
  let args = a:000[1:-1]

  if a:1 == "download"
    call exercism#Download(args)
  elseif a:1 == "submit"
    call exercism#Submit(args)
  else
    echoerr "Exercism: Unknown subcommand: '".a:1."', args: ".string(args)
    return
  endif
endfunction
function! s:ExercismComplete(_argument_lead, _command_line, _cursor_position)
  return join(["download", "submit"], "\n")
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
