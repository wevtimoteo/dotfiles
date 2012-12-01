"wolcanus .vimrc

"general options
set encoding=utf-8
set mouse=a
set nu
syntax enable 

" theme
set background=dark
colorscheme molokai
set guifont=Monaco:h15

" indent
set cindent
set cinkeys=0{,0},:,0#,!,!^F
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

" unmapping arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" turn off needless toolbar on gvim/mvim
set guioptions+=TLlRrb
set guioptions-=TLlRrb
set guioptions-=m

" ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Tab mappings.
map <C-t> :tabedit<Space>
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
set t_Co=256
let g:Powerline_symbols = 'unicode'
set nocompatible
set laststatus=2

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
set list!

" Print current path
cmap <C-e> <C-r>=expand('%:p:h')<CR>/

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"autoload NERDTree
"autocmd vimenter * NERDTree

call pathogen#infect()
