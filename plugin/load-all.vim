let s:reload_all = 0
let s:deleted_files = {} 

function! s:HandleFileChanged(file, buffer, reason)
  let current_buffer = bufnr()
  if a:reason == 'deleted'
    let s:deleted_files[a:buffer] = a:file
  elseif s:reload_all || a:reason == 'mode' || a:reason == 'time'
    let v:fcs_choice = "reload"
  else
    if a:reason == 'changed'
      let message = "W11: Warning: File \"" . a:file . "\" has changed since editing started\nSee \":help W11\" for more info."
    else
      let message = "W12: Warning: File \"" . a:file . "\" has changed and the buffer was changed in Vim as well\nSee \":help W12\" for more info."
    endif

    let choice = confirm(message, "&OK\n&Load File\nLoad &All")
    if choice == 2
      let v:fcs_choice = "reload"
    elseif choice == 3
      let v:fcs_choice = "reload"
      let s:reload_all = 1
      " Use timer as workaround to trigger FileChangedShell for other possibly changed files
      cal timer_start(0, { -> execute('call s:ChecktimeAll()') })
      " Use timer as workaround to unset s:reload_all after all files are reloaded
      cal timer_start(0, { -> execute('let s:reload_all = 0') })
    endif
  endif
endfunction

function! s:ShowDeletedError()
  if has_key(s:deleted_files, bufnr())
    echohl ErrorMsg
    echomsg 'E211: File "' . s:deleted_files[bufnr()] . '" no longer available'
    echohl None
    unlet s:deleted_files[bufnr()]
  endif
endfunction

function! s:ChecktimeAll()
  let s:deleted_files = {}
  let buffers = map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
  for i in buffers
    execute 'checktime ' . i
  endfor
  let s:checktime_all = 0
endfunction

augroup ReloadChanged
  autocmd!
  autocmd FileChangedShell * call s:HandleFileChanged(expand("<afile>"), expand("<abuf>"), v:fcs_reason)
  autocmd BufEnter * call s:ShowDeletedError()
augroup END

