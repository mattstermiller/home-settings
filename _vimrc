so ~/_commonvimrc

" vim-plug plugins
call plug#begin()
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-visual-star-search'
Plug 'chaoren/vim-wordmotion'
call plug#end()

" vim-plug commands
"   PlugInstall [name ...]  Install plugins
"   PlugUpdate [name ...]   Install or update plugins
"   PlugClean[!]            Remove unlisted plugins (bang version will clean without prompt)
"   PlugUpgrade             Upgrade vim-plug itself
"   PlugStatus              Check the status of plugins
"   PlugDiff                Examine changes from the previous update and the pending changes
"   PlugSnapshot[!] [path]  Generate script for restoring the current snapshot of the plugins

" write swap files here instead of beside each file
set directory=$HOME/vimfiles/swap//

" command aliases
command! Sorc so $MYVIMRC
command! Sorcvs so ~\_vsvimrc
" fix digitally imported playlist
command! Fixdi %s/\(DI.FM\) - \(.*\)/\2 - \1 Premium/g

let g:wordmotion_prefix = ','

" appearance
set nu " line numbers
set scrolloff=4
set laststatus=2 " airline always on
set display+=lastline " don't hide partially-visible wrapped lines
colorscheme slate
syntax on
" nice diff colors
if &diff
    set t_Co=256
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=136
endif
" fix cursor in windows terminal
if &term == 'win32'
    let &t_SI.=" \e[5 q"
    let &t_EI.=" \e[1 q"
endif

" syntax filetype associations
au BufNewFile,BufRead *.nuspec setlocal ft=xml
au BufNewFile,BufRead *.cls setlocal ft=vb

" toggle automatic line breaks
function ToggleAutoBreak()
    if &textwidth
        set textwidth=0
        echo "Not automatically breaking long lines"
    else
        set textwidth=120
        set colorcolumn=+1
        echo "Automatically breaking long lines"
    endif
endfunction
nnoremap <F9> :call ToggleAutoBreak()<cr>

" toggle expandtab
function ToggleTab()
    if &expandtab
        set noexpandtab
        echo "indenting with tabs"
    else
        set expandtab
        echo "indenting with spaces"
    endif
endfunction
nnoremap <F10> :call ToggleTab()<cr>

" show/hide whitespace chars
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.
function ToggleWhiteSpace()
    if &list
        set nolist
        echo "not showing whitespace"
    else
        set list
        echo "showing whitespace"
    endif
endfunction
nnoremap <F11> :call ToggleWhiteSpace()<cr>

