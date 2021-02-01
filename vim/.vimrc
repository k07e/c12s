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
  cal a:p.add('mattn/vim-lexiv')
endf

try
  pa vim-packager
  cal packager#setup(function('s:p'))
cat
  if executable('git')&&!isdirectory(expand('~/.vim/pack/packager/opt/vim-packager'))
    ec 'installing vim-packager ...'
    ec system('git clone -q https://github.com/kristijanhusak/vim-packager.git ~/.vim/pack/packager/opt/vim-packager')
    ec 'done'
    cal feedkeys(' ')
    pa vim-packager
    cal packager#setup(function('s:p'))
    PackagerInstall {'on_finish':'q'}
  en
endt
