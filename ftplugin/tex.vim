setlocal number
setlocal textwidth=0
setlocal wrapmargin=0
setlocal columns=85
autocmd VimResized * if (&columns > 85) | setlocal columns=85 | endif
setlocal wrap
setlocal linebreak

