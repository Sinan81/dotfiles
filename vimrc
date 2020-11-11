:noremap<C-S> :w<C-R>
:imap <c-s> <Esc>:w<CR>a
" vim should play nice with the dark font theme of the terminal
set background=dark
set tabstop=4
" enable access to system clipboard for copy paste operations
set clipboard=unnamedplus
" get rid of annoying red background for tabs in fortran as error
let fortran_have_tabs=1

" enable aliases within vim external command execute i.e. :!command
" CURRENTLY DISABLED SINCE AFTER EXECUTION OF THE COMMAND, vim EXITS
"set shellcmdflag=-ic

" ignore cases unless uppercase is indicated
" see: stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
set ignorecase
set smartcase

" MOVE A LINE UP/DOWN WITH Ctrl+Up/Down
"https://stackoverflow.com/questions/741814/move-entire-line-up-and-down-in-vim
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-up> :call <SID>swap_up()<CR>
noremap <silent> <c-down> :call <SID>swap_down()<CR>

"source ~/Documents/online_courses/linuxacademy_python_for_sys_admins/content-python-for-sys-admins/helpers/vimrc
"Set to show invisibles (tabs & trailing spaces) & their highlight color
set list listchars=tab:»\ ,trail:·

"replace tabs with spaces:
set tabstop=4 shiftwidth=4 expandtab

"use ruby syntax for puppet *.pp files
au BufReadPost *.pp set syntax=ruby

"add header location
set path+=/opt/nec/nosupport/frovedis/x86/include

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv
