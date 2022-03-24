set nu
set splitbelow
set splitright
set mouse=a
set cursorline
set guicursor=a:blinkon100


" Disable color on bars
hi SignColumn guibg=NONE ctermbg=NONE
" hi LineNr ctermfg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE

" Hightlight current line
"augroup CursorLine
  "au!
  "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  "au WinLeave * setlocal nocursorline
"augroup END

""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug '907th/vim-auto-save'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Search
  Plug 'junegunn/fzf.vim'
  Plug 'vim-scripts/peaksea'
  Plug 'vim-scripts/DoxygenToolkit.vim'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'airblade/vim-gitgutter'
  Plug 'miyakogi/conoline.vim'
  " Plug 'dominikduda/vim_current_word'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdcommenter'
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt' " Must follow vim-maktaba
  Plug 'dracula/vim'
  Plug 'RRethy/vim-illuminate'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'preservim/tagbar'
call plug#end()

set termguicolors
color dracula

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-codefmt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader>ff :FormatCode<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:coc_disable_startup_warning = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 0  " do not display the auto-save notification

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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => conoline: highlight current line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:conoline_auto_enable = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_signs = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-illuminate 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Illuminate_highlightUnderCursor = 0
hi illuminatedWordk ctermbg=15 guibg=#FFFFFF ctermfg=4 guifg=#8b0000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ycm 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['-log=verbose', '-pretty']
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ }
let g:ycm_global_ycm_extra_conf =
  \ '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

set cursorline
hi CursorLine cterm=none ctermbg=237
set cursorcolumn
hi CursorColumn cterm=none ctermbg=237

" Highlight column 80 as well as 100 and onward.
" Google java style accepts a column limit of either 80 or 100 characters.
let &colorcolumn = '80,'.join(range(100,256),',')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']

let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
