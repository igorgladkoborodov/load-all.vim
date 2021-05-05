let s:reload_all = 0

function! s:HandleFileChanged(file, reason)
  " TODO: reload automatically if reason is `mode` or `time`
  if s:reload_all
    let v:fcs_choice = "reload"
  else
    let choice = confirm("W12: Warning: File \"" . a:file . "\" has changed and the buffer was changed in Vim as well\nSee \":help W12\" for more info.", "&OK\n&Load File\nLoad &All")
    if choice == 2
      let v:fcs_choice = "reload"
    elseif choice == 3
      let v:fcs_choice = "reload"
      let s:reload_all = 1
      cal timer_start(0, { -> execute('let s:reload_all = 0') })
    endif
  endif
endfunction

function! s:ChecktimeAll()
  let buffers = map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
  for i in buffers
    execute 'checktime ' . i
  endfor
endfunction

augroup ReloadChanged
  autocmd!
  autocmd FileChangedShell * call s:HandleFileChanged(expand("<afile>"), v:fcs_reason)
  autocmd FocusGained,CursorHold * ++nested call s:ChecktimeAll()
augroup END

