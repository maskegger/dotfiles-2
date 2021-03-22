" General

set undofile                                              " Undo even after file close
set undodir=~/.config/nvim/undo                           " Undo file location
set hidden                                                " Unsaved buffer is hidden instead of closed
set autoindent                                            " Automatically indent lines
set tabstop=4                                             " Set tab to 4 spaces
set shiftwidth=4                                          " Set tab to 4 spaces
set expandtab                                             " Convert tabs to spaces
set backspace=indent,eol,start                            " Make backspace key work
set autoread                                              " Auto read when file is changed
set nowrap                                                " Does not wrap text
set laststatus=2                                          " Always display status line
set hlsearch                                              " Highlights matching search patterns
set nolist                                                " Hides special characters
set so=15                                                 " Sets 15 lines to the cursor
set ignorecase                                            " Ignores case when searching
set smartcase                                             " Case insensitive only if all letters are lowercase
set foldcolumn=1                                          " Adds a little margin
set splitbelow                                            " Opens splits below main pane
set incsearch                                             " Incremental search
set showcmd                                               " Shows entered commands
set conceallevel=0                                        " Does not hide concealed characters
set relativenumber                                        " Relative line number
set numberwidth=3                                         " Line number column width
set foldmethod=manual                                     " Manual folding
set autochdir                                             " Set working directory to current file
set signcolumn=number

set guicursor+=n-v-r:hor25 guicursor+=c-i:ver25           " Sets cursor to underline when in normal mode
set guicursor+=n-v-r-c-i:blinkwait10-blinkon20-blinkoff20 " Blink cursor

syntax on                                                 " Syntax color highlighting
filetype off                                              " Filetype detection off

let g:tex_flavor = 'latex' " Latex

let g:ale_disable_lsp = 1 " Ale with Coc.nvim

autocmd CursorHold * silent call CocActionAsync('highlight') " Highlight symbol and references

" Clean LaTeX workspace on quit
autocmd User VimtexEventQuit VimtexClean

" Spell suggestion size
set spellsuggest=7

" Hide mode
set noshowmode

" Plugins

call plug#begin('~/.vim/plugged')                                            " Plugin start

Plug 'neoclide/coc.nvim'                                                     " Coc for code linting and completion
Plug 'dense-analysis/ale'                                                    " Linting
Plug 'voldikss/vim-floaterm'                                                 " Floating terminal
Plug 'sbdchd/neoformat'                                                      " A formatter for Vim
Plug 'honza/vim-snippets'                                                    " Extra snippets for Vim
Plug 'lervag/vimtex', { 'for': 'tex' }                                       " LaTeX plugin for Vim
Plug 'jiangmiao/auto-pairs'                                                  " Automatically pair brackets
Plug 'dylanaraps/wal.vim'                                                    " Get colorscheme from XResources
Plug 'jeffkreeftmeijer/vim-dim'

call plug#end()                                                              " Plugin end

" Mappings

" Changes leader key
let mapleader=' '

" Maps redraw screen and remove highlights
map <silent> <M-r> :nohl<CR><C-l>

" Toggles floating terminal
map <silent> <C-M-n> :FloatermToggle<CR>

" Toggle spelling
map <silent> <C-M-s> :setlocal spell! spelllang=en_us<CR>

" Pressing Escape twice exits terminal buffer
tnoremap <silent> <C-[><C-[> <C-\><C-n>

" Maps quit and save
nmap <silent> <M-q> :q<CR>
nmap <silent> <M-s> :w<CR>

" Easier commands
nnoremap ; :

" Goes to file
map <silent> <C-o> gf

" Remaps Scroll up and down
map <M-k> <C-u>
map <M-j> <C-d>

" Sources Vim config file
nmap <silent> <C-A-r> :source ~/.config/nvim/init.vim <CR>

" Goto definition coc.nvim
nmap <silent> gd <Plug>(coc-definition)

" Large mappings

" Remaps Tab to choose from suggestions Coc
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() r "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enter to confirm suggestion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Format (Control+Enter F)
map <silent> <C-M>f :let _save_pos=getpos(".") <Bar>
    \ :Neoformat <Bar>
    \ :let _s=@/ <Bar>
    \ :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar>
    \ :nohl <Bar>
    \ :unlet _s<Bar>
    \ :call setpos('.', _save_pos)<Bar>
    \ :unlet _save_pos<CR><CR>

" Run code with keybinding (Control+Enter R)
autocmd BufWinEnter *.py nmap <silent> <C-M>r :w<CR>:FloatermNew python3 '%:p'<CR>
autocmd BufWinEnter *.sh nmap <silent> <C-M>r :w<CR>:FloatermNew sh '%:p'<CR>
autocmd BufWinEnter *.cpp nmap <silent> <C-M>r :w<CR>:!g++ '%:p'<CR>:FloatermNew ./a.out<CR>
autocmd BufWinEnter *.tex nmap <silent> <C-M>r :w<CR>:VimtexCompile<CR>

" Debug (Control+Enter D)
autocmd BufWinEnter *.py nmap <silent> <C-M>d :w<CR>:FloatermNew python3 -m pdb '%:p'<CR>
autocmd BufWinEnter *.cpp nmap <silent> <C-M>d :FloatermNew lldb ./a.out<CR>
autocmd BufWinEnter *.sh nmap <silent> <C-M>d :w<CR>:FloatermNew bash -x '%:p'<CR>

" Go to previous error ale (Control+Enter Left)
map <silent> <C-Left> <Plug>(ale_previous)

" Go to next error ale (Control+Enter Right)
map <silent> <C-Right> <Plug>(ale_next)

" Buffers and tabs

" Close buffer/tab
nnoremap <silent> <M-w> :bd <CR>

" New buffer
nnoremap <silent> <C-n> :new <CR>

" New tab
nnoremap <silent> <C-t> :tabnew <CR>

" Next buffer
nnoremap <silent> <M-TAB> :bn <CR>

" Next tab
nnoremap <silent> <S-TAB> :tabn <CR>

" Windows

" Horizontal and vertical splits
noremap <silent> <C-W>h :split <CR>
noremap <silent> <C-W>v :vsplit <CR>

" Window navigation
noremap <silent> <Left> <C-w>h
noremap <silent> <Down> <C-w>j
noremap <silent> <Up> <C-w>k
noremap <silent> <Right> <C-w>l

" Window resizing
noremap <silent> <M-Left> :vertical resize +5 <CR>
noremap <silent> <M-Down> :res -5 <CR>
noremap <silent> <M-Up> :res +5 <CR>
noremap <silent> <M-Right> :vertical resize -5 <CR>

" Leader bindings

" Copy to clipboard
vmap <leader>y "+y

" Colorscheme
colorscheme wal

set fillchars=vert:\
hi! VertSplit guifg=None guibg=None
hi! HorSplit guifg=None guibg=None
hi NonText guifg=bg

" Statusline config

" Ale linting
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ ' Warnings: %d Errors: %d ⎜',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction

" Highlighting
hi StatusLine guifg=#98C379 guibg=NONE

" Empty status
set statusline=

" File
set statusline+=\ %F
set statusline+=\ \╱

" Changed
set statusline+=\ %m

" Switch to right side
set statusline+=%=
set statusline+=\ \╲

" Filetype
set statusline+=\ Filetype:
set statusline+=\ %y
set statusline+=\ \╲

" Line and column
set statusline+=\ Line:
set statusline+=\ %l
set statusline+=\/%L
set statusline+=\,
set statusline+=\ Column:
set statusline+=\ %c
set statusline+=\ \╲

" Percentage through file
set statusline+=\ %p%%
set statusline+=\

" Status of linter
set statusline+=%{LinterStatus()}

" Icons ╱╲⎜

" Functions

" Toggle cursor bind
function! ToggleCursorbind()
  if &cursorbind == 1
    set nocursorbind
  else
    set cursorbind
  endif
endfunction

" Remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave ?* silent! mkview
  autocmd BufWinEnter ?* silent! loadview
augroup END
