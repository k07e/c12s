if &cp
  se nocp
en

fu s:p(p)abort
  cal a:p.add('kristijanhusak/vim-packager',{'type':'opt'})

  " Editor
  cal a:p.add('https://tpope.io/vim/abolish.git')
  cal a:p.add('https://tpope.io/vim/commentary.git')
  cal a:p.add('https://tpope.io/vim/eunuch.git')
  cal a:p.add('https://tpope.io/vim/fugitive.git')
  cal a:p.add('https://tpope.io/vim/repeat.git')
  cal a:p.add('https://tpope.io/vim/rsi.git')
  cal a:p.add('https://tpope.io/vim/sensible.git')
  cal a:p.add('https://tpope.io/vim/sleuth.git')
  cal a:p.add('https://tpope.io/vim/surround.git')
  cal a:p.add('kana/vim-textobj-user',{'requires':[
    \   'Julian/vim-textobj-brace',
    \   'Julian/vim-textobj-variable-segment',
    \   'adolenc/vim-textobj-toplevel',
    \   'adriaanzon/vim-textobj-matchit',
    \   'deathlyfrantic/vim-textobj-blanklines',
    \   'fvictorio/vim-textobj-backticks',
    \   'glts/vim-textobj-comment',
    \   'glts/vim-textobj-indblock',
    \   'jceb/vim-textobj-uri',
    \   'kana/vim-textobj-datetime',
    \   'kana/vim-textobj-diff',
    \   'kana/vim-textobj-entire',
    \   'kana/vim-textobj-function',
    \   'kana/vim-textobj-indent',
    \   'kana/vim-textobj-lastpat',
    \   'kana/vim-textobj-line',
    \   'kana/vim-textobj-syntax',
    \   'lucapette/vim-textobj-underscore',
    \   'paulhybryant/vim-textobj-path',
    \   'pianohacker/vim-textobj-indented-paragraph',
    \   'reedes/vim-textobj-quote',
    \   'rsrchboy/vim-textobj-heredocs',
    \   'saaguero/vim-textobj-pastedtext',
    \   'saihoooooooo/vim-textobj-space',
    \   'sgur/vim-textobj-parameter',
    \   'somini/vim-textobj-fold',
    \   'thinca/vim-textobj-between',
    \   'whatyouhide/vim-textobj-xmlattr',
    \   ['airblade/vim-gitgutter',{'requires':'gilligan/textobj-gitgutter'}],
    \ ]})
  cal a:p.add('mattn/vim-lexiv')

  " Look
  cal a:p.add('lifepillar/vim-gruvbox8')
  cal a:p.add('itchyny/lightline.vim')
endf

fu s:s()
  se bg=dark
  se cul
  se lcs=eol:↵,extends:»,nbsp:%,precedes:«,tab:»-,trail:·
  se list
  se ls=2
  se nosmd
  se nowrap
  se nu
  se rnu
  se stal=2
  se tgc

  let g:gitgutter_sign_added='·'
  let g:gitgutter_sign_modified='·'
  let g:gitgutter_sign_removed='·'
  let g:gitgutter_sign_removed_first_line='··'
  let g:gitgutter_sign_removed_above_and_below='.·'
  let g:gitgutter_sign_modified_removed='··'
  let g:lightline={
    \   'colorscheme':'gruvbox8',
    \   'separator': {
    \     'left': '',
    \     'right': '',
    \   },
    \   'subseparator': {
    \     'left': '',
    \     'right': '',
    \   },
    \   'tabline_separator': {
    \     'left': '',
    \     'right': '',
    \   },
    \   'tabline_subseparator': {
    \     'left': '',
    \     'right': '',
    \   },
    \ }

  colorscheme gruvbox8_hard
endf

try
  pa vim-packager
  cal packager#setup(function('s:p'))
  cal s:s()
cat
  if executable('git')&&!isdirectory(expand('~/.vim/pack/packager/opt/vim-packager'))
    ec 'installing vim-packager ...'
    ec system('git clone -q https://github.com/kristijanhusak/vim-packager.git ~/.vim/pack/packager/opt/vim-packager')
    ec 'done'
    cal feedkeys(' ')
    pa vim-packager
    cal packager#setup(function('s:p'))
    PackagerInstall {'on_finish':'q'}
    cal s:s()
  en
endt
