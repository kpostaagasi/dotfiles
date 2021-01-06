
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

let g:polyglot_disabled = ['python', 'lua', 'go', 'handlebars', 'csv']

call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'jistr/vim-nerdtree-tabs'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'yggdroot/indentline'

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'

Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'md'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['markdown', 'md']  }

Plug 'dense-analysis/ale', { 'on': 'ALELint' }
Plug 'dsawardekar/ember.vim', { 'for': ['javascript', 'handlebars.ember' ] }
Plug 'joukevandermaas/vim-ember-hbs', { 'for': ['handlebars.ember'] }
Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'honza/vim-snippets'
Plug 'alvan/vim-closetag'

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()


function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-xml',
    \ 'coc-git',
    \ 'coc-marketplace',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-vimlsp',
    \ 'coc-tsserver',
    \ 'coc-python',
    \ 'coc-go',
    \ 'coc-lua',
    \ 'coc-clangd',
    \ 'coc-sh',
    \ 'coc-ember',
    \ 'coc-docker',
    \ 'coc-snippets',
    \ 'coc-template',
    \ 'coc-emmet',
    \ 'coc-prettier',
    \ 'coc-yank',
    \ ]

command! -nargs=0 Format :call CocAction('format')

let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = 'vsp'

let g:indentline_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

let g:goyo_width = 100

let g:user_emmet_mode = 'a'
let g:user_emmet_install_global = 0
autocmd FileType html,css,htmldjango EmmetInstall

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%code%] %s [%severity%]'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_change = 0
let g:ale_open_list = 1
let g:ale_list_window_size = 3
highlight ALEError ctermbg=White
highlight ALEError ctermfg=DarkRed
highlight ALEWarning ctermbg=LightYellow
highlight ALEWarning ctermfg=Darkmagenta

autocmd FileType python let b:ale_linters = ['flake8']
autocmd FileType python let b:ale_fixers = ['autopep8', 'yapf']
autocmd FileType python let b:ale_warn_about_trailing_whitespace = 0
autocmd FileType json let g:indentLine_conceallevel = 0

let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 1

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'up':'~80%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5} }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "x",
    \ "Staged"    : "✚",
    \ "Untracked" : "o",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "D",
    \ "Dirty"     : "~",
    \ "Clean"     : "*",
    \ 'Ignored'   : '&',
    \ "Unknown"   : "?"
    \ }

" For Accidental quick saves. I sometimes press "w" while pressing shift...
command! -nargs=* W w

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.hbs'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,html.handlebars,htmldjango'

" python syntax
let g:python_highlight_all = 1

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses
