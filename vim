syntax on
set smartindent
if has("vms")
      set nobackup	
"else	  
"    set backup
endif
set ruler
set showcmd
set nu

" pathogen
execute pathogen#infect()

"智能补全起效
filetype plugin indent on
set tabstop=4
set encoding=utf-8
let &termencoding=&encoding
set expandtab
set shiftwidth=4
set foldcolumn=2
set incsearch
set foldmethod=marker
set backupdir=~/backup/vim
set backupext=.bak
set showmatch
set cul
set hls
set noerrorbells
set autoindent
set number
set nobackup
set background=light
set backspace=indent,eol,start
"colorscheme molokai
"set background=dark
"colorscheme xcodedark
set t_Co=256                                                    " 开启256色支持
set fileencodings=ucs-bom,utf-8,gb2313,gb18030,gbk,cp936,latin1
set fileformats=unix,dos,mac
set mouse=a                                                     " 启用鼠标
nnoremap <ScrollWheelUp> "+y
nnoremap <ScrollWheelDown> "+p
set helplang=cn                                                 " 中文帮助文档
set nomodeline
set relativenumber                                              " 相对行号
set wrap                                                        " 自动换行
set showcmd                                                     " 显示输入信息
set cursorline                                                  " 显示光标所在行
set cursorcolumn                                                " 显示光标所在列
set wildmenu                                                    " 显示补全提示
set hlsearch                                                    " 高亮搜索结果set nocompatible              " be iMproved, required
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/pack/dist/start/vim-airline
call vundle#begin()
Plugin 'kien/ctrlp.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_depth = 5
let g:ctrlp_switch_buffer = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline_theme='powerlineish'

call vundle#end()
filetype plugin indent on
autocmd FileType text setlocal textwidth=78

set csto=0
"set aw
map s <nop>
" 保存
map S :w<CR>
" 退出
map Q :q<CR>
" 右分屏，聚焦右窗口
map sl :set splitright<CR>:vsplit<CR>
" 左分屏，聚焦左窗口
map sh :set nosplitright<CR>:vsplit<CR>
" 上分屏，聚焦上窗口
map sk :set nosplitbelow<CR>:split<CR>
" 下分屏，聚焦下窗口
map sj :set splitbelow<CR>:split<CR>
" 光标移至右窗口
map <LEADER>l <C-w>l
" 光标移至上窗口
map <LEADER>k <C-w>k
" 光标移至下窗口
map <LEADER>j <C-w>j
" 光标移至左窗口
map <LEADER>h <C-w>h

" 当前窗口移至右边
map <LEADER>L <C-w>L
" 当前窗口移至上边
map <LEADER>K <C-w>K
" 当前窗口移至下边
map <LEADER>J <C-w>J
" 当前窗口移至左边
map <LEADER>H <C-w>H

" 窗口上移
map <up> :res +5<CR>
" 窗口下移
map <down> :res -5<CR>
" 窗口左移
map <left> :vertical resize-5<CR>
" 窗口右移
map <right> :vertical resize+5<CR>
" 新建标签页
map tn :tabe<CR>
" 前一标签页
map t- :-tabnext<CR>
" 后一标签页
map t= :+tabnext<CR>
" 重新加载vim配置文件
" map rc :source $MYVIMRC<CR>
map rc :source ~/.config/nvim/init.vim<CR>
" 寻找两个相等的单词
map <LEADER>fd /\(\<\w\+\>\)\_s*\1
" 替换占空符<++>
map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>c4l
" 全选
nmap <C-a> ggVG
if v:version >= 700
    :nmap <C-w>p :tabprevious<cr>
"    :nmap <C-w>]:tabnext<cr>
    :map <C-w>p :tabprevious<cr>
"    :map <C-w>n :tabnext<cr>
"    :imap <C-w>p <ESC>:tabprevious<cr>i
"    :imap <C-w>x <ESC>:tabnext<cr>i
    :nmap <C-w>t :tabnew<cr>
    :imap <C-w>t <ESC>:tabnew<cr>
endif

if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif

set helplang=en
"colorscheme desert 
colorscheme torte


set dictionary+=~/tools/dictionary/functions.txt
set complete-=k complete+=k
function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
let g:neocomplcache_enable_at_startup = 1

"Tlist
if &diff
	let Tlist_Auto_Open=0
else
	let Tlist_Auto_Open=1
endif
let Tlist_Auto_Update=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1


"Doxygen toolkit
"C style like //
"let g:DoxygenToolkit_commentType = "C++" 
let g:DoxygenToolkit_authorName="willas, <chenfei-s@360.cn>"
"let g:DoxygenToolkit_blockHeader="-------------------------------------"
"let g:DoxygenToolkit_blockFooter="-------------------------------------"
let s:licenseTag="Module Name:\<enter>"
let s:licenseTag=s:licenseTag."Project:\<enter>"
let s:licenseTag=s:licenseTag."opyright (C) 2006-2013, Qihoo 360 Technology Co., Ltd. All Rights Reserved.\<enter>\<enter>\<enter>"
let s:licenseTag=s:licenseTag."This program is an unpublished copyrighted work which is proprietary to\<enter>"
let s:licenseTag=s:licenseTag."Qihoo 360 Technology Co., Ltd. and contains confidential information that\<enter>"
let s:licenseTag=s:licenseTag."is not to be reproduced or disclosed to any other person or entity without\<enter>"
let s:licenseTag=s:licenseTag."prior written consent from Qihoo 360 Technology Co., Ltd. in each and every\<enter>"
let s:licenseTag=s:licenseTag."instance.\<enter>\<enter>"
let s:licenseTag=s:licenseTag."Author: willas, <chenfei-s@360.cn>"
let g:DoxygenToolkit_licenseTag=s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
noremap \dc <Esc>:Dox<CR>
noremap \dd <Esc>:DoxUndoc<CR>
noremap \da <Esc>:DoxAuthor<CR>
noremap \dl <Esc>:DoxLic<CR>


"winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>


"软件功能:
"多文件编辑,可以用tab显示多个文件。/minibufexpl.vim=MiniBufExplorer插件
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

"NERDTree
nnoremap <silent> <F6> :NERDTree<CR>  

"eclim
"set nocompatible
"filetype plugin indent on

"clipboard
"set clipboard = unamed
"
" case switching with ~
" With the following (for example, in vimrc), you can visually select text
" then press ~ to convert the text to UPPER CASE, then to lower case, then to
" Title Case. Keep pressing ~ until you get the case you want.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
" nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>

" Vi navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

" Open files always in new tabs
" autocmd VimEnter * tab all
" autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'

""""""""""""""" status line
"let laststatus = 2

" google/vim-codefmt
" ref to: https://github.com/google/vim-codefmt
"augroup autoformat_settings
"  autocmd FileType bzl AutoFormatBuffer buildifier
"  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
"  autocmd FileType dart AutoFormatBuffer dartfmt
"  autocmd FileType go AutoFormatBuffer gofmt
"  autocmd FileType gn AutoFormatBuffer gn
"  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"  autocmd FileType java AutoFormatBuffer google-java-format
"  autocmd FileType python AutoFormatBuffer yapf
"  # Alternative: autocmd FileType python AutoFormatBuffer autopep8
"  autocmd FileType rust AutoFormatBuffer rustfmt
"  autocmd FileType vue AutoFormatBuffer prettier
"augroup END

""" clang format
" ref to: https://vimawesome.com/plugin/ 

" Auto-enabling auto-formattingvim-clang-format
" autocmd FileType c ClangFormatAutoEnable

let g:clang_format#command = 'clang-format'
let g:clang_format#code_style= 'google'
nmap <F4> :ClangFormat<cr>
let g:clang_format#detect_style_file = 1
map <F6> :call RunCode()<CR>
func! RunCode()
    exec "w"
    if &filetype == 'python'
        set splitright
        :vsp
        "set splitbelow
        ":sp
        ":res -10

        redir @a
        silent exec "g /^#!.*python2$/ %"
        redir END
        if @a == ''
            :term python2 %;echo '\n[python2]'
        else
            :term python3 %
        endif
        normal i
    endif

    if &filetype == 'r'
        "set splitright
        ":vsp
        set splitbelow
        :sp
        :res -10
        :term Rscript %
        normal i
        if filereadable('Rplots.pdf')
            exec "!zathura Rplots.pdf &"
        endif
    endif

    if &filetype == 'c'
        set splitbelow
        exec "!gcc % -Wall -o %<"
        :sp
        :res -10
        :term ./%<
        normal i
    endif

    if &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -10
        :term ./%<
        normal i
    endif

    if &filetype == 'markdown'
        exec "MarkdownPreview"
    endif

    if &filetype == 'tex'
        ":SCCompile
        "silent exec "!/usr/local/texlive/2019/bin/x86_64-linux/xelatex % >/tmp/nvimlatex"
        "redir @a
        "silent echo system('~/.config/nvim/scripts/IsError.sh')
        "redir END
        "let Error = len(@a)
        "if Error == 1
          "silent exec "!zathura %<.pdf &"
          "":LLPStartPreview
        "else
          "echo @a
        "endif
        "set splitright
        exec "!/usr/local/texlive/2019/bin/x86_64-linux/xelatex %"
        "exec "FloatermNew /usr/local/texlive/2019/bin/x86_64-linux/xelatex %"
        silent :!zathura %<.pdf &
      endif
endfunc

" <C-F5>
map <F29> :call RUN_latexmk()<CR>
func! RUN_latexmk()
    exec "w"
    if &filetype == 'tex'
        "":SCCompile
        ""silent exec "pkill zathura"
        "exec "!/usr/local/texlive/2019/bin/x86_64-linux/pdflatex % >/tmp/nvimlatex"
        "redir @a
        "silent echo system('~/.config/nvim/scripts/IsError.sh')
        "redir END
        "let Error = len(@a)
        "if Error == 1
          "silent exec "!zathura %<.pdf &"
          "":LLPStartPreview
        "else
          "echo @a
        "endif
        exec "!/usr/local/texlive/2019/bin/x86_64-linux/pdflatex %"
        silent :!zathura %<.pdf &
      endif
endfunc

" Shfit + F5
map <F17> :call RunCodeRepl()<CR>
func! RunCodeRepl()
    exec "w"
    if &filetype == 'python'
            if search("@profile")
                    exec "AsyncRun kernprof -l -v %"
                    exec "copen"
                    exec "wincmd p"
             elseif search("set_trace()")
                     exec "!python3 %"
             else
                    exec 'vertical rightbelow copen 60'
                    exec 'wincmd w'
                    exec "AsyncRun -raw python3 %"
                    exec "copen"
                    exec "wincmd p"
            endif
    endif
    if &filetype == 'tex'
        :LLPStartPreview
    endif
    if &filetype == 'markdown'
        silent exec "!markmap --no-open %"
        silent exec "!surf %<.html"
    endif
endfunc
