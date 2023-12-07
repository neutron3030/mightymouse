set noshowmode

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \     'left': [['mode', 'readonly'],
  \              ['fugitive'],
  \              ['filename', 'modified']],
  \     'right': [['percent', 'lineinfo']]
  \ },
  \ 'inactive': {
  \     'left': [['filename']],
  \     'right': [['percent', 'lineinfo']]
  \ },
  \ 'component': {
  \     'lineinfo': "\ue0a1".' %3l:%-2v',
  \ },
  \ 'component_function': {
  \     'readonly': 'LightlineReadonly',
  \     'modified': 'LightlineModified',
  \     'fugitive': 'LightlineFugitive'
  \ },
  \ 'separator': {'left': "\ue0bc", 'right': "\ue0ba"},
  \ 'subseparator': {'left': '', 'right': ''}
  \ }

function! LightlineReadonly()
  return &readonly ? "\ue0a2" : ''
endfunction

function! LightlineModified()
  return &modified ? '+' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0".' '.branch : ''
  endif
  return ''
endfunction
