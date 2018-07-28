if exists('g:loaded_exercism') || &cp
  finish
endif

let g:loaded_exercism = '0.0.1' " version number
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
function! s:ExercismComplete(argument_lead, command_line, _cursor_position)
  let subcommand = matchstr(a:command_line, '^E\%[xercism]\s\+\zs\w\+\ze\s\+')

  if subcommand ==# 'submit'
    return join(getcompletion(a:argument_lead, 'file'), "\n")
  elseif subcommand ==# 'download'
    return join(["--track=", "--exercise=", "--uuid="], "\n")
  elseif subcommand ==# ''
    " No subcommand yet, complete subcommands
    return join(["download", "submit"], "\n")
  else
    " Unknown subcommand, no completion
    return ""
  endif
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
