function! Rshell(name, cmd, ...)
  let scratch = " | setlocal buftype=nofile"
  let reader = " | r! "
  let mkcmd = ":command! -nargs=? "

  if a:0 == 1
    let opts = " | " . a:1
  else
    let opts = ""
  endif

  let scmd = "S" . a:name
  let vcmd = "V" . a:name
  let ecmd = "E" . a:name

  exec mkcmd . scmd . " :new" . scratch . opts . reader .a:cmd
  exec mkcmd . vcmd . " :vnew" . scratch . opts . reader . a:cmd
  exec mkcmd . ecmd . " :enew" . scratch . opts . reader . a:cmd
endfunction
