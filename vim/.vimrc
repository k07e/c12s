if &cp
  se nocp
en

fu s:p(p)abort
  cal a:p.add('kristijanhusak/vim-packager',{'type':'opt'})
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
