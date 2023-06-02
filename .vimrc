set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'

Plugin 'rust-lang/rust.vim'

Plugin 'NLKNguyen/papercolor-theme'
set background=dark
colorscheme PaperColor

Plugin 'preservim/nerdtree'
let g:NERDTreeNodeDelimiter = "\u00a0"

Plugin 'ycm-core/YouCompleteMe'

Plugin 'pechorin/any-jump.vim'

Plugin 'sebdah/vim-delve'

Plugin 'ngemily/vim-vp4'

Plugin 'tpope/vim-fugitive'

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

set backspace=indent,eol,start

" vim-go customizations
filetype plugin indent on

set autowrite
syntax on
set ruler

" Go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" Close autocomplete preview window - ycm
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Map t to ctrl + t for popping a stack. Tags
nmap t <c-t>
" This is an override of prev command. This will take you to previous place
" whatever it is
" nnoremap t <C-o>

" ctrlp file search
let g:ctrlp_max_files = 100000

let g:python_highlight_all = 1

" For Ycm python go to definition
nnoremap gd :YcmCompleter GoToDefinition<CR>

" C completion
let g:ycm_semantic_triggers =  {
  \   'c,cpp,objc': [ 're!\w{3}', '_' ],
  \ }

" For vim-go debugger
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

let g:go_debug_mappings = {
      \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
      \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
      \ '(go-debug-step)': {'key': 's'},
      \ '(go-debug-print)': {'key': 'p'},
  \}

map <leader>ds :GoDebugStart<cr>
map <leader>dt :GoDebugStop<cr>
map <leader>db :GoDebugBreakpoint<cr>

nnoremap <Leader>vlcm :cd $VLCM<CR>

" AnyJump settings

" Show line numbers in search rusults
let g:any_jump_list_numbers = 0

" Auto search references
let g:any_jump_references_enabled = 1

" Auto group results by filename
let g:any_jump_grouping_enabled = 0

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 10

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'rg'
