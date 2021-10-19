set nu
set splitbelow
set splitright

""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'rhysd/vim-clang-format'
  Plug '907th/vim-auto-save'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Search
  Plug 'junegunn/fzf.vim'
  Plug 'vim-scripts/peaksea'
  Plug 'vim-scripts/DoxygenToolkit.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-clang-format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader>ff :ClangFormat<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_disable_startup_warning = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
nnoremap <silent> <C-p> :call FZFOpen(':Files')<CR>
nnoremap <silent> <C-f> :call FZFOpen(':Rg')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd TreeEditorConfig (project-specific EditorConfig rule)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-o> :NERDTreeFind<CR>

// Symbol rename
nmap <F2> <Plug>(coc-rename)
