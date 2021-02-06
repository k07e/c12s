if &cp
  se nocp
en

fu s:p(p)abort
  cal a:p.add('kristijanhusak/vim-packager',#{type:'opt'})

  " Editor
  cal a:p.add('907th/vim-auto-save')
  cal a:p.add('hrsh7th/vim-vsnip-integ',#{requires:'hrsh7th/vim-vsnip'})
  cal a:p.add('https://tpope.io/vim/abolish.git')
  cal a:p.add('https://tpope.io/vim/commentary.git')
  cal a:p.add('https://tpope.io/vim/eunuch.git')
  cal a:p.add('https://tpope.io/vim/repeat.git')
  cal a:p.add('https://tpope.io/vim/rsi.git')
  cal a:p.add('https://tpope.io/vim/sensible.git')
  cal a:p.add('https://tpope.io/vim/sleuth.git')
  cal a:p.add('https://tpope.io/vim/surround.git')
  cal a:p.add('junegunn/gv.vim',#{requires:'https://tpope.io/vim/fugitive.git'})
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
  cal a:p.add('liuchengxu/vim-which-key',#{type:'opt'})
  cal a:p.add('mattn/vim-lexiv')
  cal a:p.add('mattn/vim-lsp-settings',#{requires:'prabirshrestha/vim-lsp'})
  cal a:p.add('mbbill/undotree')
  cal a:p.add('prabirshrestha/asyncomplete-lsp.vim',#{requires:'prabirshrestha/asyncomplete.vim'})
  cal a:p.add('voldikss/vim-floaterm')

  " Look
  cal a:p.add('itchyny/lightline.vim',#{requires:[
    \ 'lambdalisue/battery.vim',
    \ 'sinetoami/lightline-hunks',
    \ ]})
  cal a:p.add('junegunn/limelight.vim',#{requires:[
    \   ['junegunn/goyo.vim',#{type:'opt'}],
    \ ],type:'opt'})
  cal a:p.add('lifepillar/vim-gruvbox8')
  cal a:p.add('nathanaelkane/vim-indent-guides')
  cal a:p.add('ryanoasis/vim-devicons',#{requires:[
    \   ['preservim/nerdtree',#{requires:[
    \     ['PhilRunninger/nerdtree-visual-selection',#{type:'opt'}],
    \     ['Xuyuanp/nerdtree-git-plugin',#{type:'opt'}],
    \     ['tiagofumo/vim-nerdtree-syntax-highlight',#{type:'opt'}],
    \   ],type:'opt'}],
    \ ],type:'opt'})
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
se mouse=a
se nosmd
se nowrap
se nu
se rnu
se stal=2

fu LightlineComponent_autosave()
  retu exists('g:auto_save')&&g:auto_save?'AUTOSAVE':''
endf

let g:floaterm_keymap_toggle='\tf'
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
  \   active:#{
  \     left:[['mode','autosave','paste'],['lightline_hunks','readonly','filename','modified']],
  \     right:[['lineinfo'],['percent'],['filetype','fileformat','fileencoding','battery','clock']],
  \   },
  \   colorscheme:'gruvbox8',
  \   component:#{
  \     clock:'%{strftime(''%H:%M'')}',
  \   },
  \   component_function:#{
  \     autosave:'LightlineComponent_autosave',
  \     battery:'battery#component',
  \     lightline_hunks:'lightline#hunks#composer',
  \   },
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
let g:undotree_WindowLayout=3
let g:which_key_map=#{
  \   f:#{
  \     name:'+focus',
  \     n:[':NERDTreeFocus','NERDTree'],
  \     u:[':UndotreeFocus','Undotree'],
  \   },
  \   o:#{
  \     name:'+open',
  \     g:[':GV','GV'],
  \   },
  \   t:#{
  \     name:'+toggle',
  \     a:[':AutoSaveToggle','AutoSave'],
  \     f:[':FloatermToggle','floaterm'],
  \     g:[':Goyo','Goyo'],
  \     l:[':Limelight!!','Limelight'],
  \     p:[':se invpaste','paste'],
  \     t:[':NERDTreeToggle','NERDTree'],
  \     u:[':UndotreeToggle','Undotree'],
  \   },
  \ }

try
  pa limelight.vim
  pa goyo.vim
  aug vimrc_limelight
    au!
    au User GoyoEnter Limelight
    au User GoyoLeave Limelight!
  aug END
cat
  fini
endt

try
  pa vim-devicons
  pa nerdtree
  pa nerdtree-git-plugin
  pa nerdtree-visual-selection
  pa vim-nerdtree-syntax-highlight
cat
  fini
endt

try
  pa vim-which-key
  cal which_key#register("\<Bslash>",'g:which_key_map')
cat
  fini
endt

nn <silent><leader> :<c-u>WhichKey '<Bslash>'<CR>
vn <silent><leader> :<c-u>WhichKeyVisual '<Bslash>'<CR>
