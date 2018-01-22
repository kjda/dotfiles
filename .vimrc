abbr funciton function
syntax on
colorscheme monokai
set background=dark
set backspace=indent,eol,start

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set textwidth=80

set showmatch           " highlight matching [{()}]
set cursorline  " highlight current line/hlsearch
set number
set hls is
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


" Always use vertical diffs
set diffopt+=vertical

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap h <NOP>
noremap l <NOP>

nmap <F1> :NERDTreeToggle<CR>
nmap <silent> <leader>n :NERDTreeToggle<CR>


" quit all
nnoremap <leader>x :qa<cr>
nmap <leader>w :w!<cr>

inoremap ii <ESC>

" Command-T
nmap ,, <C-p>

" switch tabs
nmap .. :ls<cr>:buffer<Space>

" Next tab
nmap nn :tabn<cr> 

nmap <silent> <c-space> :tabp<cr> 

map <c-n> :tabnew<cr>

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

"" ll# -> goes to next file

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"VUNDLE!!!

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'vim-jp/vim-go-extra'
Plugin 'ElmCast/elm-vim'
Plugin 'othree/html5.vim'
Plugin 'shougo/neocomplete.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'moll/vim-node'
Plugin 'elzr/vim-json'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'suan/vim-instant-markdown' 
Plugin 'sickill/vim-monokai'
Plugin 'vim-syntastic/syntastic'
Plugin 'elixir-lang/vim-elixir'
" , {'do': 'npm install -g instant-markdown-d'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'


" By default the leader shortcut is defined as: \ .. one may map it to a different char liek this:  let mapleader = \",\" 
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>d <Plug>(go-def) 
autocmd FileType go nmap <Leader>i <Plug>(go-info)

let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
"let g:go_metalinter_autosave = 1
"This will add new commands, called :A, :AV, :AS and :AT. Here :A works just like :GoAlternate, it replaces the current buffer with the alternate file. 
":AV will open a new vertical split with the alternate file. :AS will open the alternate file in a new split view and :AT in a new tab.
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1


set backupdir=~./vim-tmp,~./.tmp,~/tmp,/var/tmp,/tmp
set directory=~./vim-tmp,~./.tmp,~/tmp,/var/tmp,/tmp

"set clipboard=unnamed 
if $TMUX == ''
	set clipboard+=unnamed
endif
set ttyfast

" search
set ignorecase
set smartcase

set switchbuf=usetab,newtab

let NERDTreeShowHidden=1


filetype plugin indent on

let g:elm_format_autosave = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')

let g:neocomplete#enable_at_startup = 1

set wildignore+=*/.git/*,*/.hg/*,*/.DS_Store,*/vendor,*/node_modules

let g:ctrlp_working_path=0 "change the working directory during a Vim session and make CtrlP respect that change
let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<c-t>'],
        \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
        \ }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
