syntax on
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=0 expandtab
set nu
set background=dark
set noswapfile
set incsearch
set undodir=~/.vim/undodir
set undofile
set colorcolumn=80
set splitbelow 
set splitright
set hidden
set nobackup

call plug#begin('~/.vim/plugged')
" usage
Plug 'tpope/vim-repeat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'rhysd/vim-clang-format'
Plug 'mbbill/undotree'
" search
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
" themes and stuff for looks
Plug 'tyrannicaltoucan/vim-deep-space' 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
" syntax highlight
Plug 'sheerun/vim-polyglot'

call plug#end()
set rtp+=/home/christopher/.fzf

" color scheme related
"
"
colorscheme gruvbox
set background=dark
set termguicolors
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
let g:python_highlight_space_errors = 0
let g:gruvbox_constrast_dark ="hard"

" custom shortcuts
" 
"
let mapleader= " "
map <silent> <leader>h :wincmd h<CR>
map <silent> <leader>j :wincmd j<CR>
map <silent> <leader>k :wincmd k<CR>
map <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <Leader>re :NERDTreeToggle<CR>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nnoremap <Leader>rg :Rg<SPACE>
" remap C-o C-i since tab completion fucks it up
nnoremap <Leader>o <C-o>
nnoremap <Leader>i <C-i>
" remap  switching between src and header
nnoremap <silent> <Leader>fs :CocCommand clangd.switchSourceHeader<CR>
"
" fzf starts from root git dir
fun! s:find_git_root()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction 

nnoremap <silent> <Leader>ff :exe 'Files' . <SID>find_git_root()<CR>
"
" COC nvim config 
"
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" Clang-format
"
let g:clang_format#detect_style_file=1
nnoremap <Leader>P :ClangFormat<CR>
