   syntax on
   filetype off                  " required
     
   let g:python3_host_prog='/usr/bin/python3'
   let g:python2_host_prog='/usr/bin/python2'

   colorscheme gruvbox
   let g:gruvbox_contrast_light = 'medium'
   let g:gruvbox_bold = 1
   let g:gruvbox_termcolors = 256
   
   " set the runtime path to include Vundle and initialize
   set rtp+=~/.config/nvim/bundle/Vundle.vim 
   call vundle#begin('~/.config/nvim/bundle')
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')
   "
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
   Plugin 'morhetz/gruvbox'
   Plugin 'scrooloose/nerdtree'
   Plugin 'vim-vdebug/vdebug'
   Plugin 'lvht/phpcd.vim'
   Plugin 'bling/vim-airline'
   Plugin 'scrooloose/syntastic'
   Plugin 'valloric/youcompleteme'
   Plugin 'kien/ctrlp.vim'
   Plugin 'airblade/vim-gitgutter'
   Plugin 'tpope/vim-surround' 
   Plugin 'mhartington/nvim-typescript'
   Plugin 'herringtondarkholme/yats.vim'
   Plugin 'godlygeek/tabular'
   Plugin 'plasticboy/vim-markdown'
   Plugin 'JamshedVesuna/vim-markdown-preview' 
   Plugin 'Chiel92/vim-autoformat'
   " All of your Plugins must be added before the following line
   call vundle#end()            " required
   
   " Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

  
  call plug#begin()

    function! DoRemote(arg)
      UpdateRemotePlugins
    endfunction
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }


    "Javascript Plugins
    Plug 'carlitux/deoplete-ternjs'
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

    "Typescript Plugins
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }
    Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
    Plug 'mhartington/deoplete-typescript'
    Plug 'ryanoasis/vim-devicons'
    call plug#end()


    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_camel_case = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#max_abbr_width = 0
    let g:deoplete#max_menu_width = 0
    let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
    call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

    let g:tern_request_timeout = 1
    let g:tern_request_timeout = 6000
    let g:tern#command = ["tern"]
    let g:tern#arguments = ["--persistent"]
    let g:deoplete#sources#tss#javascript_support = 1
    let g:tsuquyomi_javascript_support = 1
    let g:tsuquyomi_auto_open = 1
    let g:tsuquyomi_disable_quickfix = 1

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



let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
let vim_markdown_preview_browser='google-chrome-stable'

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
