function! mentorcism#Download(args)
  let args = map(a:args, 'shellescape(v:val)')
  let output = systemlist('mentorcism download '.join(args, ' '))
  if v:shell_error
    echoerr join(output, "\n")
    return
  endif

  let download_dir = matchstr(join(output, ' '), 'Downloaded to \zs\f\+\ze')
  exe 'cd '.download_dir
  exe 'tabnew '.fnamemodify(download_dir .'/README.md', ':~:.')
endfunction

function! mentorcism#Submit(args)
  let args = map(a:args, 'shellescape(v:val)')
  if len(args) == 0
    let args = [expand('%')]
  endif

  let output = systemlist('mentorcism submit '.join(args, ' '))
  if v:shell_error
    echoerr join(output, "\n")
    return
  endif
endfunction
