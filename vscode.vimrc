" Repeat pastes even if paste replaced something https://stackoverflow.com/questions/7163947/paste-multiple-times
xnoremap p pgvy
" Make Y behave like D/C. Operate from current position til end of line.
noremap Y y$

inoremap kj <esc>
vnoremap kj <esc>
cnoremap kj <C-C>

" Reselect blocks after indenting in visual/select mode
xnoremap < <gv
xnoremap > >gv|
