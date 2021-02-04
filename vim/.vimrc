if &cp
  se nocp
en

fu s:p(p)abort
  cal a:p.add('kristijanhusak/vim-packager',#{type:'opt'})

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
  cal a:p.add('kana/vim-textobj-user',#{requires:[
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
    \   ['airblade/vim-gitgutter',#{requires:'gilligan/textobj-gitgutter'}],
    \ ]})
  cal a:p.add('mattn/vim-lexiv')
  cal a:p.add('mattn/vim-lsp-settings',#{requires:'prabirshrestha/vim-lsp'})
  cal a:p.add('prabirshrestha/asyncomplete-lsp.vim',#{requires:'prabirshrestha/asyncomplete.vim'})

  " Look
  cal a:p.add('itchyny/lightline.vim')
  cal a:p.add('lifepillar/vim-gruvbox8')
  cal a:p.add('nathanaelkane/vim-indent-guides')
endf

fu s:i()abort
  PackagerInstall #{on_finish:'qa'}
endf
com Install cal s:i()

try
  pa vim-packager
  cal packager#setup(function('s:p'))
  se bg=dark tgc
    \ |colorscheme gruvbox8_hard
cat
  fini
endt

se cul
se lcs=eol:↵,extends:»,nbsp:%,precedes:«,tab:»-,trail:·
se list
se ls=2
se nosmd
se nowrap
se nu
se rnu
se stal=2

let g:gitgutter_sign_added='·'
let g:gitgutter_sign_modified='·'
let g:gitgutter_sign_removed='·'
let g:gitgutter_sign_removed_first_line='··'
let g:gitgutter_sign_removed_above_and_below='.·'
let g:gitgutter_sign_modified_removed='··'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:lightline=#{
  \   colorscheme:'gruvbox8',
  \   separator:#{
  \     left:'',
  \     right:'',
  \   },
  \   subseparator:#{
  \     left:'',
  \     right:'',
  \   },
  \   tabline_separator:#{
  \     left:'',
  \     right:'',
  \   },
  \   tabline_subseparator:#{
  \     left:'',
  \     right:'',
  \   },
  \ }
