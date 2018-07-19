function! exercism#Download(args)
  let args = map(a:args, 'shellescape(v:val)')
  let output = systemlist('exercism download '.join(args, ' '))
  if v:shell_error
    call s:ExternalError(output)
    return
  endif

  let download_dir = matchstr(join(output, ' '), 'Downloaded to \zs\f\+\ze')
  exe 'cd '.download_dir
  exe 'tabnew '.fnamemodify(download_dir .'/README.md', ':~:.')
endfunction

function! exercism#Submit(args)
  let args = map(a:args, 'shellescape(v:val)')
  if len(args) == 0
    let args = [expand('%')]
  endif

  let output = systemlist('exercism submit '.join(args, ' '))
  if v:shell_error
    call s:ExternalError(output)
    return
  endif
endfunction

function! s:ExternalError(output)
  for line in a:output
    echoerr line
  endfor
endfunction
