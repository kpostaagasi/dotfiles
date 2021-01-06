map qq :q!<Enter>
map qw :wq<Enter>
cmap w!! w !sudo tee %

map <PageUp> <NOP>
map <PageDown> <NOP>
map! <PageUp> <NOP>
map! <PageDown> <NOP>

map <ESC>[1;5C <C-Right>
map <ESC>[1;5D <C-Left>
map <ESC>[1;5A <C-Up>
map <ESC>[1;5B <C-Down>

map <C-c> :NERDTreeTabsToggle<CR>
nmap <F8> :Vista!!<CR>
nmap <F7> :CocList --number-select diagnostics<CR>

map <C-g> :Goyo<CR>

map <C-h> <C-w>h
map <C-Left> <C-w>h
map <C-l> <C-w>l
map <C-Right> <C-w>l
map <C-j> <C-w>j
map <C-Down> <C-w>j
map <C-k> <C-w>k
map <C-Up> <C-w>k

map <C-s><up> :tabr<cr>
map <C-s><down> :tabl<cr>
map <C-s><left> :tabp<cr>
map <C-s><right> :tabn<cr>

nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>

imap <C-k> <Plug>(coc-snippets-expand-jump)
vmap <C-j> <Plug>(coc-snippets-select)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:floaterm_keymap_toggle = '<F2>'
let g:floaterm_keymap_next   = '<F3>'
let g:floaterm_keymap_prev   = '<F4>'
let g:floaterm_keymap_new    = '<F5>'

nmap ff :Files<cr>
nmap ft :BTags<cr>
nmap fT :Tags<cr>
nmap fl :BLines<cr>
nmap fL :Lines<cr>
nmap fg :GFiles?<cr>
nmap fb :Buffers<cr>
nmap fc :BCommits<cr>
nmap fC :Commits<cr>

tnoremap <Esc> <C-\><C-n>

autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
