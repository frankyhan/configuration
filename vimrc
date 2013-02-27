" Configuration file for vim
set modelines=0" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible" Use Vim defaults instead of 100% vi compatibility
set backspace=2" more powerful backspacing

syntax on
" �﷨����

"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul
" ��ǳɫ������ǰ��

set smartindent
" ���ܶ���

set autoindent
" �Զ�����

set confirm
" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��

set tabstop=4
" Tab���Ŀ��

set softtabstop=4
set shiftwidth=4
"  ͳһ����Ϊ4

set noexpandtab
" ��Ҫ�ÿո�����Ʊ��

" set number
" ��ʾ�к�

set history=50
" ��ʷ��¼��

set hlsearch
set incsearch
" �������ַ�����

set gdefault
" �����滻

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
" ��������

colorscheme torte
" ������ɫ����

"set guifont=Menlo:h16:cANSI
" ��������

set langmenu=zn_CN.UTF-8
set helplang=cn
" ��������

set cmdheight=2
" �����У���״̬�У��ĸ߶ȣ�Ĭ��Ϊ1,������2

set ruler
" �ڱ༭�����У������½���ʾ���λ�õ�״̬��

set laststatus=2
" ������ʾ״̬��

set showcmd
" ��״̬����ʾĿǰ��ִ�е����δ��ɵ�ָ��Ƭ�������ʾ����

set scrolloff=3
" ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���

set showmatch
" ������ʾ��Ӧ������

set matchtime=5
" ��Ӧ���Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩

set autowrite
" ���л�bufferʱ�Զ����浱ǰ�ļ�

set wildmenu
" ��ǿģʽ�е��������Զ���ɲ���

set linespace=2
" �ַ���������������Ŀ

set whichwrap=b,s,<,>,[,]
" ����Normal��Visualģʽ��Backspace�����ո������������ҷ������Insert��replaceģʽ����������ҷ�������еĹ��ܡ�

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

filetype plugin indent on
" ��Ϊ���������file on, file plugin on, file indent on.�ֱ��ʾ�Զ�ʶ���ļ����ͣ����ļ����ͽű���ʹ�����������ļ���

"==================�Զ���ļ�ӳ��======================

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
" �����Զ�����

map <F8> :if exists("syntax_on") <BAR>
\    syntax off <BAR><CR>
\  else <BAR>
\syntax enable <BAR>
\  endif
" ����<F7>����syntax on/off��ԭ������ʱ����ɫ̫�������Ķ���

map <F5> :call Compile()<CR>
func! Compile()
exec "w"
exec "!g++ % -g -Wall"
endfunc
" <F5>���������C����

map <F6> :call Run()<CR>
func! Run()
"exec "!g++ % -o %<"
exec "! ./a.out"
"exec "! ./<"
endfunc
" <F6>���������C++����

map <F7> :call GDB()<CR>
func! GDB()
exec "! gdb a.out"
endfunc
" <F7>���������C++����

let Tlist_Ctags_Cmd = "/sw/bin/ctags"
let Tlist_WinWidth = 40
map <F4> :TlistToggle<cr>

"map <space> <c-f> 
"map <A-Space> <c-b> 

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
