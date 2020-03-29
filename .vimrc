" automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" backup & swap files
"set nobackup
"set nowritebackup
"set noswapfile
set backupdir=~/.vim/backupdir

" configure pathogen
execute pathogen#infect()

" automatically change window's cwd to file's dir
set autochdir

" visual bell instead of beeping
set visualbell

" enable mouse
set mouse=a

" enable backspace
set bs=2

filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

" folding by indentation
set fdm=indent

" show search matches as you type
set incsearch
" highlight search terms
set hlsearch

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

" handle tabs as spaces
set expandtab    " change tabs to spaces while typing
set tabstop=4    " number of spaces when tab key is pressed
set softtabstop=4    " yeah, what ever
set shiftwidth=4    " number of spaces inserted for indentation
set shiftround    " what ever

" mark trailing tabs and spaces
set list listchars=tab:>.,trail:.,extends:#,nbsp:.

" automatically remove trailing whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

" Press F5 for whitespace removal
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Color scheme
" but what about 'real', non emulator terminals?
set t_Co=256
color wombat256mod

" always show status line
set laststatus=2

" menu at bottom
set wildmenu
set wildmode=longest:full

" Showing line numbers & length
set number
set colorcolumn=80
highlight ColorColumn ctermbg=233

" wrapping for .tex files
autocmd BufRead,BufNewFile *.tex setfiletype tex
" set number
" set textwidth=0
" set wrapmargin=0
" set columns=85
" autocmd VimResized * if (&columns > 85) | set columns=85 | endif
" set wrap
" set linebreak

" clipboard behavior like I am used to
set clipboard=unnamedplus

" Behavior of explorer mode (':E')
" ':Texplore' for explorer mode in new tab
" :e get <tab>
" :e get <Ctrl-d>
let g:netrw_liststyle=1

" map usefull shortcuts
" '<c>' stands for 'CTRL'
" <C-q> doesn't work due to lxterminal
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>

" rebind <Leader> key
let mapleader="<"

" save & quit
map <Leader>w :wa!<CR>
map <Leader>q :wqa!<CR>

" easy commenting / uncommenting
vmap <Leader>cc :s/^/# /<cr>
vmap <Leader>vv :s/^# //<cr>

" easy movement across windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" show a visual line under the cursor's current line
set cursorline
set cursorcolumn

" show the matching part of the pair for [] {} and ()
"set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1
" easier moving between tabs
map <Leader>y <esc>:tabprevious<CR>
map <Leader>x <esc>:tabnext<CR>

" Use <leader>b to add a pdb shortcut
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" map ctrl n to line numbers
nmap <C-N><C-N> :set invnumber<CR>


" jedi python autocompletion
" :help jedi-vim
" jedi is automatically initialized. If you don't want that disable it
let g:jedi#auto_initialization = 1
" some VIM options (like completeopt and key defaults) which are automatically
" initialized, but you can skip
let g:jedi#auto_vim_configuration = 1
" use tabs when going to a definition
let g:jedi#use_tabs_not_buffers = 1
" automatically starts the completion, if you type a dot, e.g. str.,
" if you don't want this
let g:jedi#popup_on_dot = 0
" selects the first line of the completion menu
" for a better typing-flow and usually saves one keypress.
let g:jedi#popup_select_first = 1
let g:jedi#auto_close_doc = 1
" displays function call signatures in insert mode in real-time,
" highlighting the current argument. The call signatures can be displayed as a
" pop-up in the buffer (set to 1, the default), which has the advantage of
" being easier to refer to, or in Vim's command line aligned with the
" function call (set to 2), which can improve the integrity of
" Vim's undo history.
let g:jedi#show_call_signatures = "1"

let g:jedi#completions_command = "<C-Space>"
let g:jedi#documentation_command = "K"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"


" python-mode
let g:pymode = 1

" support virtualenv
let g:pymode_virtualenv = 1

" documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" autofold code
let g:pymode_folding = 0

" motion
let g:pymode_motion = 0
" [[                Jump to previous class or function (normal, visual, operator modes)
" ]]                Jump to next class or function  (normal, visual, operator modes)
" [M                Jump to previous class or method (normal, visual, operator modes)
" ]M                Jump to next class or method (normal, visual, operator modes)
" aC                Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC                Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM                Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" iM                Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)


" Breakpoints plugin
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
" To close automatically after tab comletion
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" to not open at all
" set completeopt=menu

" code checking
" choose from 'pylint', 'pep8', 'mccabe', 'pep257', 'pyflakes'
let g:pymode_lint = 1
let g:pymode_lint_checker = ['pylint', 'pep8', 'pep257']

" Check code when editing (on the fly)
let g:pymode_lint_on_fly = 1

" Auto check on save
let g:pymode_lint_on_write = 1

" Auto open cwindow (quickfix) if any errors have been found
let g:pymode_lint_cwindow = 0

" Trim unused white spaces on save
let g:pymode_trim_whitespaces = 0

" rope
let g:pymode_rope = 0

" Disable searching for |.ropeproject| in parent directories
" `:PymodeRopeNewProject` to create `.ropeproject` in current project dir
"let g:pymode_rope_lookup_project = 0

" manually set the rope project directory
" If not specified rope will use the current directory
" let g:pymode_rope_project_root = ""

"let g:pymode_rope_show_doc_bind = 'K'
"let g:pymode_rope_completion_bind = '<C-Space>'
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences

" for LaTex in GVim
if has('gui_running')
  set grepprg=grep\ -nH\ $*
  filetype indent on
  let g:tex_flavor='latex'
endif
