   syntax on
   set background=dark
   filetype off                  " required
     
   let g:python3_host_prog='/usr/bin/python3'
   let g:python2_host_prog='/usr/bin/python2'

   " set the runtime path to include Vundle and initialize
   set rtp+=~/.config/nvim/bundle/Vundle.vim 
   call vundle#begin('~/.config/nvim/bundle')
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')

   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'

   Plugin 'tpope/vim-fugitive'


   " The following are examples of different formats supported.
   " Keep Plugin commands between vundle#begin/end.
   " plugin on GitHub repo
   " plugin from http://vim-scripts.org/vim/scripts.html
   " Plugin 'L9'
   " Git plugin not hosted on GitHub
   Plugin 'git://git.wincent.com/command-t.git'
   " git repos on your local machine (i.e. when working on your own plugin)
   " Plugin 'file:///home/gmarik/path/to/plugin'
   " The sparkup vim script is in a subdirectory of this repo called vim.
   " Pass the path to set the runtimepath properly.
   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
   " Install L9 and avoid a Naming conflict if you've already installed a
   " different version somewhere else.
   " Plugin 'ascenator/L9', {'name': 'newL9'}

   Plugin 'dbakker/vim-projectroot'
   Plugin 'stanangeloff/php.vim'
   Plugin 'flazz/vim-colorschemes'
   Plugin 'morhetz/gruvbox'
   Plugin 'scrooloose/nerdtree'
   Plugin 'vim-vdebug/vdebug'
   Plugin 'lvht/phpcd.vim'
   Plugin 'bling/vim-airline'
   Plugin 'scrooloose/syntastic'
   Plugin 'valloric/youcompleteme'
   Plugin 'kien/ctrlp.vim'
   Plugin 'airblade/vim-gitgutter'
 
   " All of your Plugins must be added before the following line
   call vundle#end()            " required
   filetype plugin indent on    " required
   " To ignore plugin indent changes, instead use:
   "filetype plugin on
   "
   " Brief help
   " :PluginList       - lists configured plugins
   " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
   " :PluginSearch foo - searches for foo; append `!` to refresh local cache
   " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
   "
   " see :h vundle for more details or wiki for FAQ
   " Put your non-Plugin stuff after this line
   "
   let g:rootmarkers = ['.projectroot', 'docker-compose.yml', '.git', '.hg', '.svn', '.bzr','_darcs','build.xml']

function! SetupDebug()
  let g:vdebug_options['path_maps'] = {'/app': call('projectroot#get', a:000)}
   "Hack to override vdebug options
  source ~/.config/nvim/bundle/vdebug/plugin/vdebug.vim
endfunction
autocmd VimEnter * :call SetupDebug()
  
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
