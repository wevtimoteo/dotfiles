" wevtimoteo .vimrc

" Plugins -- Using vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'

Plug 'gcmt/wildfire.vim'
Plug 'bronson/vim-trailing-whitespace'

" Required by codequery
Plug 'Shougo/unite.vim'
Plug 'devjoe/vim-codequery'

" Loaded when lang file is opened
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'ex', 'exs'] }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'othree/html5.vim', { 'for': 'html' }

Plug 'hashivim/vim-terraform', { 'for': 'tf' }

" Multiple file types
Plug 'rhysd/vim-crystal', { 'for': ['crystal', 'cr'] }

Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell', 'hs'] }


Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js'] }
Plug 'walm/jshint.vim', { 'for': ['javascript', 'js'] }
Plug 'posva/vim-vue', { 'for': ['javascript', 'js'] }

Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'md'] }

Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rb', 'erb'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rb'] }
Plug 'dgsuarez/reruby.vim', { 'for': ['ruby', 'rb'] }

" Add plugins to &runtimepath
call plug#end()

"general options
set encoding=utf-8
set mouse=a
set nu
syntax enable
syntax on

au BufRead,BufNewFile Podfile set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile Berksfile set filetype=ruby
au BufRead,BufNewFile *.hamlc set filetype=haml
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile .env.example set filetype=sh
au BufRead,BufNewFile .env.development set filetype=sh

" theme
set background=dark
colorscheme dracula
colo dracula
set guifont="Monaco":h15

hi Comment ctermfg=146

hi Normal guibg=NONE ctermbg=NONE
hi CursorLine ctermbg=235
hi Search ctermbg=218 ctermfg=198

" Show theme hi CursorLine
set cursorline

" indent
set cinkeys=0{,0},:,0#,!^F
set smartindent
set autoindent

" show when searching
set incsearch
" highlight all the matches in search
set hlsearch

" show dir list when tab dir
set wildmode=list:longest

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

filetype indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


"make Y consistent with C and D
nnoremap Y y$

" turn off needless toolbar on gvim/mvim
set guioptions+=TLlRrb
set guioptions-=TLlRrb
set guioptions-=m

" Using this mapping, you can press Alt-/
" in order to automatically fill in a
" range" for your search
vnoremap <M-/> <Esc>/\%V

" ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Tab mappings.
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

nnoremap <C-j> 5j
nnoremap <C-k> 5k

set pastetoggle=<F3>

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"NERDtree
"map for Exp
nmap <leader>e :Exp<CR>

" Default settings
set ts=2 sts=2 sw=2 expandtab

" remember more commands and search history
set history=1000

" use many muchos levels of undo
set undolevels=1000

set wildignore=*.swp,*.bak,*.pyc,*.class

" change the terminal's title
set title

" don't beep
set visualbell
set noerrorbells

set nobackup
set noswapfile

"configs for powerline
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set nocompatible
set laststatus=2

let g:airline_powerline_fonts = 1

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"set list!

" Increase and decrease split size 10 in 10
nmap <silent> <leader>< :10winc <<CR>
nmap <silent> <leader>> :10winc ><CR>

" Better navigation for wrapped lines
nmap j gj
nmap k gk

nmap [ <leader>

" Abbreviations
ab pryb require 'pry';binding.pry

" Enabling SnipMate
filetype plugin on

" Print current path
cmap <C-e> <C-r>=expand('%:p:h')<CR>/

" Check spell and limit text length for commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

autocmd BufRead,BufNewFile *.tokamak set filetype=ruby

" Build tags for the current directory
nmap <F2> :!/usr/bin/ctags-exuberant -R .<CR>
"Ctags search always lists all occurrences
nmap <C-]> g<C-]>

" unmapping arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nmap ; :

" increment and decrement with arrow keys
nmap <up> <C-a>
nmap <down> <C-x>

" Dealing with TMUX unnamed clipboard
set clipboard=unnamed

" Vim-notes
let g:notes_directories = ['~/Dropbox/Notes']
"
" Cyclomatic Complexity Ruby
let g:flog_enable=0
nmap <F4> :call ToggleFlog()<CR>

" Mappings to move lines: http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <D-j> :m .+1<CR>==
nnoremap <D-k> :m .-2<CR>==
" inoremap <D-j> <Esc>:m .+1<CR>==gi
" inoremap <D-k> <Esc>:m .-2<CR>==gi
vnoremap <D-j> :m '>+1<CR>gv=gv
vnoremap <D-k> :m '<-2<CR>gv=gv

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Alignment
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Transforms old Ruby hash syntax to new one
map <leader>: :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /gc<CR>

" Transform JSON strings in Ruby symbols
map <leader>" :%s/"\(.\+\)":/\1:/gc<CR>

" Codeclimate
nmap <Leader>aa :CodeClimateAnalyzeProject<CR>
nmap <Leader>ao :CodeClimateAnalyzeOpenFiles<CR>
nmap <Leader>af :CodeClimateAnalyzeCurrentFile<CR>

" CtrlP ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules$',
  \ }

" flagship
set laststatus=2
set showtabline=2
set guioptions-=e
let g:tablabel = "%N%{flagship#tabmodified()} %{flagship#tabcwds('shorten',',')}"

" Custom ignore for CtrlP
let g:ctrlp_custom_ignore = '_build\|deps\|vendor\|node_modules\|priv\/static\|tmp\|.log$'
