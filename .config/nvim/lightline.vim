function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! GitStatus() abort
    return get(g:, 'coc_git_status', '')
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! s:lightline_coc_diagnostic(kind, sign) abort
    let info = get(b:, 'coc_diagnostic_info', 0)
    if empty(info) || get(info, a:kind, 0) == 0
      return ''
    endif
    return printf('%s %d', a:sign, info[a:kind])
endfunction

function! LightlineCocErrors() abort
    return s:lightline_coc_diagnostic('error', 'E')
endfunction

function! LightlineCocWarnings() abort
    return s:lightline_coc_diagnostic('warning', 'W')
endfunction

function! LightlineCocInfos() abort
    return s:lightline_coc_diagnostic('information', 'I')
endfunction

function! LightlineCocHints() abort
    return s:lightline_coc_diagnostic('hints', 'H')
endfunction

autocmd User CocDiagnosticChange call lightline#update()

let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', 'readonly' ],
    \             [ 'gitbranch', 'filename' ],
    \             [ 'cocstatus' ] ],
    \   'right': [['percent', 'lineinfo'],
    \             [ 'filetype', 'fileencoding' ],
    \             [ 'currentfunction', 'coc_error', 'coc_warning', 'coc_hint', 'coc_info']]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'gitbranch': 'GitStatus',
    \   'currentfunction': 'CocCurrentFunction',
    \   'filename': 'LightlineFilename',
    \   'linter': 'StatusDiagnostic',
    \ },
    \ 'component_expand': {
\   'coc_error'        : 'LightlineCocErrors',
\   'coc_warning'      : 'LightlineCocWarnings',
\   'coc_info'         : 'LightlineCocInfos',
\   'coc_hint'         : 'LightlineCocHints',
\   'coc_fix'          : 'LightlineCocFixes',
    \ },
    \ 'component_type': {
    \   'coc_error'        : 'error',
    \   'coc_warning'      : 'warning',
    \   'coc_info'         : 'tabsel',
    \   'coc_hint'         : 'middle',
    \   'coc_fix'          : 'middle',
    \ }
    \ }
