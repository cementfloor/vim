set nocompatible              " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'NLKNguyen/papercolor-theme'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'tpope/vim-fugitive'

Plugin 'ayu-theme/ayu-vim'

Plugin 'chriskempson/base16-vim'

Plugin 'arcticicestudio/nord-vim'

Plugin 'puremourning/vimspector'

" Python AutoComplete
Plugin 'davidhalter/jedi-vim'

" Vim File explorer
Plugin 'scrooloose/nerdtree'

Plugin 'pechorin/any-jump.vim'

" Bazel plugins
" Add maktaba and bazel to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'bazelbuild/vim-bazel'

let ayucolor="dark"

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on
syntax on
colorscheme PaperColor
set ruler

set autowrite
" set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start " more powerful backspacing

" To remove the preview for function definitions in vim
set completeopt-=preview

" Go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Jedi-vim settings for python
let g:jedi#goto_definitions_command = "gd"
let g:jedi#goto_assignments_command = "ga"

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" status line types/signatures
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

" Map keys for most used commands
" Ex: `\b` for building, `\r` for running and `\t` for running tests
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" For :GoDef - Open in new tab or split window
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Autocompletion on pressing dot
" au filetype go inoremap <buffer> . .<C-x><C-o>

" Adding vlcm cscope.out for python files
" cscope add $vlcm/cscope.out
"

" Map t to ctrl + t for popping a stack
nmap t <c-t>

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
