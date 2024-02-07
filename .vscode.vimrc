" Make Y behave like D/C. Operate from current position til end of line.
noremap Y y$

inoremap kj <esc>
vnoremap kj <esc>
cnoremap kj <C-C>

" DISABLED. Reselect blocks after indenting in visual/select mode. But VSCode breaks this
" xnoremap < <gv
" xnoremap > >gv|
