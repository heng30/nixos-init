set number " 设置显示行号
set relativenumber "显示先对行号
set ruler " 在状态栏显示光标的当前位置（位于哪一行哪一列）
set showmode " 在底部显示，当前处于命令模式还是插入模式
set showcmd " 命令模式下，在底部显示，当前键入的指令
set cmdheight=1 " 展示命令行的高度
set laststatus=2 " 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set scrolloff=3 " 设置滚屏时保留3行
set sidescrolloff=5   " Show next 5 columns while side-scrolling.
set wrap " 自动折行，即太长的行分成几行显示
set novisualbell "不要闪烁
set confirm " 在处理未保存或只读文件的时候，弹出确认
set magic "设置魔术

set expandtab " 设置自动将 Tab 转为空格
set completeopt-=preview " 代码补全时，关闭preview window

if &filetype == 'css' || &filetype == 'json' || &filetype == 'html' || &filetype == 'vue'
    set tabstop=2 " tab 键设置为4个空格
    set shiftwidth=2 " 按下>>（增加一级缩进）、<<（取消一级缩进）、==（取消全部缩进）
    set softtabstop=2 " Tab 转为多少个空格
else
    set tabstop=4 " tab 键设置为4个空格
    set shiftwidth=4 " 按下>>（增加一级缩进）、<<（取消一级缩进）、==（取消全部缩进）
    set softtabstop=4 " Tab 转为多少个空格
endif

set nohlsearch " 搜索时，不高亮显示匹配结果
set incsearch " 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set showmatch " 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个
set ignorecase smartcase " 搜索时忽略大小写且智能匹配
set hidden " 切换buffers时,不提示保存buffer"

set lazyredraw
set regexpengine=1

set smartindent " 打开智能缩进
set autoindent " 自动缩进
set cindent "c文件自动缩进

" zo -> 打开一个折叠
" zc -> 进行折叠
" za -> 没有折叠的进行折叠，已经折叠的则打开
" zi -> 打开所有没有被打开的折叠，重复按时，对上一次zi打开的折叠进行折叠
" zr -> 打开所有折叠一层
" zm -> 进行所有折叠一层
" zR -> 打开所有折叠
" zM -> 进行所有折叠
set foldenable
set foldmethod=syntax
set foldlevelstart=99 "打开文件是默认不折叠代码

set conceallevel=1

set history=1000 " Vim 需要记住多少次历史操作
set undofile " 保留撤销历史
set undodir=/tmp//
set backupdir=/tmp//
set directory=/tmp//
" set nobackup
" set noswapfile

" set autochdir " 该配置可以将工作目录自动切换到，正在编辑的文件的目录
set autowrite "自动保存
set autoread  " 打开文件监视。如果在编辑过程中文件发生外部改变，就会发出提示

" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full

" 递归搜索目录下的文件,通过 :find 可以进行查找
set path+=$PWD/**

set fileencodings=utf-8,gbk
set termencoding=utf-8
set encoding=utf-8

set termguicolors " 终端显示颜色
set background=dark " 背景设为黑色
set t_Co=256 " 使用256颜色

set noerrorbells " 出错时，不要发出响声
set nocompatible " 去除VI一致性,必须
set updatetime=100 " 设置更新时间间隔
set clipboard^=unnamed,unnamedplus " 设置复制到系统剪贴板

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if has('nvim')
    set viminfo='100,n$HOME/.vim/files/info/viminfo
endif

" 查找当前目录, 项目目录和向上查找,直到找到ctags
set tags=./ctags;,ctags

syntax on " 打开语法检查

" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

" ============================================================="

let mapleader=' ' " 设置leader键

imap jj <Esc>

" ctrl+u删除内容时,保存内容到寄存器, undo时能够恢复
inoremap <c-u> <c-g>u<c-u>

" ctrl+w删除内容时,保存内容到寄存器, undo时能够恢复
inoremap <c-w> <c-g>u<c-w>

" 加速按键移动
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" 设置光标窗口移动快捷键
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap [ad :call D_allBuf()<CR>
nmap [d :call D_oneBuf()<CR>
nmap [l :bn<CR>
nmap [h :bp<CR>
nmap [o :b#<CR>
nmap [j :b<space>
nmap [- :sb<space>
nmap [\ :vertical sb<space>

" 关闭 Ex 模式
nmap Q <Nop>

" 关闭方向键控制
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" 编译代码,并将错误输出到quickfix窗口
nmap \m :call CODE_MAKE()<CR>

" 对代码进行debug
nmap \d :call CODE_DEBUG()<CR>

" 运行代码
nmap \r :call CODE_RUN()<CR>

" 代码格式化
nmap \f :call  CODE_FORMAT()<CR>

" 打开缓存区搜索
nmap <leader><leader> :CtrlPBuffer<CR>

" 调整窗口大小快捷键
nmap <leader>= :vert res +5<CR>
nmap <leader>- :vert res -5<CR>
nmap <leader>] :res +5<CR>
nmap <leader>[ :res -5<CR>

" 在选定的行尾(不包括空行)加上特定字符
vmap <leader>ac :g/./normal A

" 书签映射
nmap <silent><leader>bm :BookmarkToggle<CR>
nmap <silent><leader>bj :BookmarkNext<CR>
nmap <silent><leader>bk :BookmarkPrev<CR>
nmap <silent><leader>bi :BookmarkAnnotate<CR>
nmap <silent><leader>ba :BookmarkShowAll<CR>
nmap <silent><leader>bd :BookmarkClear<CR>
nmap <silent><leader>bc :BookmarkClearAll<CR>

" 打开quickfix窗口
nmap <leader>co :botright cwindow 10<CR>

" 关闭quickfix窗口
nmap <leader>cc :cclose<CR>

" quickfix窗口条目的下一个
nmap <leader>cn :cnext<CR>

" quickfix窗口条目的上一个
nmap <leader>cp :cprevious<CR>

" 清理多余的空行,仅留一个空行
nmap <leader>cl :g/^$/,/./-1j<CR>

" 删除所有空行
nmap <leader>dl :%g/^$/d<CR>

" 微信打赏语句
nmap <leader>ds :call DaShang()<CR>

" far 相关
nmap <leader>fa :Far<space><C-r><C-w><space>
nmap <leader>fd :call Fardo_del_buf()<CR>

" utf8格式相关
nmap <leader>fi :call File2UTF8()<CR>
nmap <leader>fo :call Fold2UTF8()<CR>

" 获取当前文件的绝对路径
nmap <leader>fp :echo expand('%:p')<CR>

" 搜索项目文件的关键词
nmap <leader>gv :Grep<space>\<\><Left><Left>

" coc 快捷键映射
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" 显示函数文档注释
nmap <leader>gk :call Show_documentation()<CR>

" 查找帮助文档zeal
nmap <leader>gz :!zeal "<cword>" 2> /dev/null &<CR><CR>

" 居中对其
nmap <leader>lc :center<CR>

" vim-surround 映射
" cs 修改分隔符
" ds 删除分隔符
" 在单词间添加特定符号
nmap <leader>iw ysiw

" 在一行间添加特定符号
nmap <leader>il yss

" 搜索符号, 类似与tjump
nmap <leader>ls :CocList symbols<CR>

" 展示诊断信息
nmap <leader>ld :CocList diagnostics<CR>

" 保存当前的vim布局
nmap <leader>ms :mksession! vim.session<CR>

" 因为tmux占用了 ` 按键,采用此方法来生成markdown的代码块格式
nmap <leader>mc i```<esc>a<CR>

" 打卡和关闭NERDTree
nmap <leader>nn :NERDTreeToggle<CR>

" 添加新行
nmap <leader>nl o<ESC>

" 立即退出
nmap <leader>qn :q!<CR>

" 因为tmux占用了 ` 按键,采用此方法来生成markdown的代码块格式
nmap <leader>qq i<space>`<esc>a

" 重载配置
nmap <leader>rl :source ~/.vimrc<CR>
nmap <leader>rn :RnvimrToggle<CR>

" 替换中文符号替换为英文符号
nmap <leader>ra :call Chinese2English()<CR>

"显示光标处内容所在函数
nmap sf :call ShowFuncName()<CR>

" easymotion 映射
nmap ss <Plug>(easymotion-s2)

nmap <Leader>sj <Plug>(easymotion-j)
nmap <Leader>sk <Plug>(easymotion-k)
nmap <Leader>sl <Plug>(easymotion-lineforward)
nmap <Leader>sh <Plug>(easymotion-linebackward)

" 替换光标下的单词
nmap <leader>sw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" 对选定行进行排序
vmap <leader>sl :sort<CR>

" 使用google翻译
nmap <leader>tl :TranslateW<CR>

" 打开和关闭tagbar
nmap <leader>tt :TagbarToggle<CR>

" 创建tag文件
" ctrl+] 跳转到tag
" g+ctrl+] 模糊搜索tag
" ctrl+t 调回上一个tag位置
nmap <leader>tg :!ctags -R -o ctags<CR>

" 根据ctags在项目文件中进行搜索跳转
nmap <leader>tj :tjump<space>

" 根据ctags在本文进行搜索跳转
nmap <leader>ta :tag<space>

" 跳转到下一个匹配
nmap <leader>tn :tnext<CR>

" 跳转到上一个匹配
nmap <leader>tp :tprev<CR>

" 插入时间戳
nmap <leader>ts :call Timestamp()<CR>

" 显示undo历史
nmap <leader>ul :MundoToggle<CR>

" 在git使用情况下,文件的变化情况
nmap <leader>vd :Gvdiffsplit<CR>

" 显示git提交历史
nmap <leader>vg :GV<CR>

" 写入
nmap <leader>wn :w<CR>

" 水平打开函数定义窗口
nmap <leader>wo <c-w>]

" 十六进制打来文件
nmap <leader>xd :%!xxd<CR>

" tmux配色
if executable('tmux')
    let g:vimIsInTmux = 1
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
    let g:vimIsInTmux = 0
endif

" ==================== Plugin Start ============================="
call plug#begin('~/.vim/plugged')

" 显示寄存器的内容
Plug 'junegunn/vim-peekaboo'

" 显示undo历史
Plug 'simnalamburt/vim-mundo'

" 不同缩进用虚线表示
Plug 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor=""
let g:vim_json_syntax_conceal = 0

" 开始页
Plug 'mhinz/vim-startify'

" 括号不同颜色区分
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" 配色方案
Plug 'w0ng/vim-hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" 上方缓冲区标题栏
Plug 'ap/vim-buftabline'

" 下方状态栏
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'humansize' ],
      \              [ 'lineinfo', 'percent', 'totalline' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%04B',
      \   'humansize' : "%{HumanSize(line2byte('$') + len(getline('$')))}",
      \   'totalline' : "%{line('$')}"
      \ },
      \ }

" c 和 cpp 函数列表
Plug 'majutsushi/tagbar'
let g:tagbar_width = 25
let g:tagbar_ctags_bin = '/usr/bin/ctags'

" 目录导航栏
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=0
let NERDTreeAutoDeleteBuffer=1
let NERDTreeWinSize=25
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeIgnore = ['\.swp$', '\.o$', '\.un\~$', '\.git$', '\.pyc$', '\.svn$', '\.out$', '^%', 'target', 'zig-cache', 'zig-out', '\.fvm', 'vcpkg_installed']

Plug 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_autoclose = 0

Plug 'xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \}

" 显示git提交情况, 文件对比情况
Plug 'junegunn/gv.vim'

" 在右侧通过git显示文件变化情况
Plug 'airblade/vim-gitgutter'
let g:gitgutter_grep = 'grep'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

" 用于代码重构
Plug 'brooth/far.vim'
let g:far#default_mappings = 0
let g:far#auto_preview = 0
let g:far#source = 'vimgrep'
let g:far#window_layout = 'current' " 以buffer的形式打开
let g:far#file_mask_favorites = ['%', '**/*.*']
let g:far#default_file_mask = '%' " 当前buffer
let g:far#auto_delete_replaced_buffers = 1
let g:far#auto_write_replaced_buffers = 1

" 注释
Plug 'tpope/vim-commentary'

" 自动补全括号
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsCenterLine = 0

" 快速搜索当前文本内容
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " 关闭默认映射
let g:EasyMotion_smartcase = 1 " 忽略大小写
let g:EasyMotion_startofline = 1 " 保存在行首

" 搜索文件和缓冲区
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader><Enter>' " 重映射ctrlP, 同时也是Enter按键
let g:ctrlp_use_caching = 0 " 不使用缓存，能搜索到新加入的文件
let g:ctrlp_by_filename = 1 " 仅匹配文件名
let g:ctrlp_working_path_mode = 'w' " 工作目录作为开始的搜索目录
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v([\/]\.(git|hg|svn|fvm)$)|target|build|zig-cache|zig-out|node_modules|vcpkg_installed',
    \ 'file': '\v(^[\.%_]+)|(\.(exe|so|dll|d|o|a|lst|tmp|zip|swp|tar|gz|E)$)',
    \ 'link': 'some_bad_symbolic_links',
    \ }

" 搜索文件内容
Plug 'dkprice/vim-easygrep'
let g:EasyGrepMode = 0     " All:0, Open Buffers:1, TrackExt:2,
let g:EasyGrepCommand = 1  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " 递归搜索
let g:EasyGrepIgnoreCase = 0 " 忽略大小写
let g:EasyGrepJumpToMatch = 0 " 不跳转到第一个匹配的选项
let g:EasyGrepInvertWholeWord = 1 "<leader>vv 是匹配整个单词, <leader>vV 是使用通配符匹配"
let g:EasyGrepWindowPosition = 'botright' " 在下方打开quickfix窗口
let g:EasyGrepFilesToExclude = "*.bak,*.a,*.o,*.pyc,*.lst,*.d,*.zip,*.so,*.gz,*.tar,*.dis,*.map,*.size,*.readelf,*.asm,*.E,ctags,*.sym,*.log,node_modules,target,build,vcpkg_installed"

" 再次打开文件时进入到上次退出的位置
Plug 'farmergreg/vim-lastplace'

" 使光标在 jk 移动时速度随时间的增加而增加
Plug 'rhysd/accelerated-jk'
let g:accelerated_jk_acceleration_table = [2, 4, 7, 12]

" 显示颜色
Plug 'norcalli/nvim-colorizer.lua'

Plug 'sakshamgupta05/vim-todo-highlight'
let g:todo_highlight_config = {
            \   'todo': {
            \     'gui_fg_color': '#0f0fff',
            \     'gui_bg_color': '#affd3a',
            \   },
            \   'TODO': {
            \     'gui_fg_color': '#0f0fff',
            \     'gui_bg_color': '#affd3a',
            \   },
            \   'FIXME': {
            \     'gui_fg_color': '#000000',
            \     'gui_bg_color': '#af2d3a',
            \   },
            \   'NOTE': {
            \     'gui_fg_color': '#000000',
            \     'gui_bg_color': '#ff2ffa',
            \ },
            \  'WARN': {
            \     'gui_fg_color': '#000000',
            \     'gui_bg_color': '#a0ff00',
            \ }
            \}

" 翻译英文
Plug 'voldikss/vim-translator'
let g:translator_target_lang = 'zh'
let g:translator_history_enable = 1
let g:translator_default_engines = ['bing']

" 显示颜色
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']
let g:Hexokinase_highlighters = [ 'foreground' ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" 自动查找项目的根目录,并进行切换
Plug 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1
let g:rooter_patterns = ['.rooter', 'Makefile']

" 替换单词或行的内容
Plug 'tpope/vim-surround'

" 高亮下标单词
Plug 'RRethy/vim-illuminate'
let g:Illuminate_highlightUnderCursor = 0
let g:Illuminate_delay = 150
hi link illuminatedWord Visual

" 书签
Plug 'MattesGroeger/vim-bookmarks'
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_auto_save = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_location_list = 0

" qml代码高亮
Plug 'peterhoeg/vim-qml'

" 定义了很多不同语言的snipptes，这些snippets会被补全引擎使用
Plug 'honza/vim-snippets'
Plug 'dcampos/nvim-snippy' " snippets 补全引擎
imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)

" 代码补全
Plug 'tomlion/vim-solidity'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-calc',
    \ 'coc-cmake',
    \ 'coc-json',
    \ 'coc-pyright',
    \ 'coc-flutter',
    \ 'coc-tsserver',
    \ '@yaegassy/coc-volar',
    \ '@yaegassy/coc-tailwindcss3'
    \]
" set coc-tailwindcss3 for rust file
" - open ~/.config/coc/extensions/node_modules/@yaegassy/coc-tailwindcss3/package.json
" - modify package.json file
"```
    "\"tailwindCSS.includeLanguages\": {
    "  \"default\": {
    "    ...
    "    \"rust\": \"html\"
    "  },
    "}
"```

call plug#end()

colorscheme hybrid

if has('nvim')
    " setup norcalli/nvim-colorizer.lua
    lua require'colorizer'.setup()
endif
" ========================= Plugin End===================================="

" 保存文件时自动更新ctags文件
" autocmd BufWritePost *.c call system("ctags -R -o ctags")

autocmd BufRead,BufNewFilE,InsertEnter * se cul "用浅色高亮当前行

" 文件类型重定义
autocmd BufRead,BufNewFilE *.qml   set filetype=qml
autocmd BufRead,BufNewFilE *.toml    set filetype=toml
autocmd BufRead,BufNewFilE *.cool    set filetype=cool
autocmd BufRead,BufNewFilE *.md      set filetype=markdown
autocmd BufRead,BufNewFilE *.ys      set filetype=cfg
autocmd BufRead,BufNewFilE *.conf      set filetype=cfg
autocmd BufRead,BufNewFilE *.slint   set filetype=slint
autocmd BufRead,BufNewFilE zathurarc   set filetype=cfg
autocmd BufRead,BufNewFilE Justfile   set filetype=make
autocmd BufRead,BufNewFilE *.pro   set filetype=cfg

" 定义文件注释类型
autocmd FileType c,cpp,verilog,qml,slint,dart setlocal commentstring=//\ %s
autocmd FileType asm,nix setlocal commentstring=#\ %s
autocmd FileType cool setlocal commentstring=--\ %s
autocmd FileType typescriptreact setlocal commentstring={/*\ %s\ */}
autocmd BufRead,BufNewFilE *.[ly],*.sol setlocal commentstring=//\ %s
autocmd BufRead,BufNewFilE *.toml,*ys setlocal commentstring=#\ %s
autocmd BufRead,BufNewFilE *.vue setlocal commentstring=<!--\ %s\ -->
autocmd BufRead,BufNewFilE *.pro setlocal commentstring=#\ %s
autocmd BufNewFile *.c,*.cpp,*.go,*.rs,*.zig,*.sh,*.html,*.css,Makefile,*.sol,*.vue call AUTO_GEN_CODE()
" autocmd BufRead *.txt setlocal spell " 在打开txt文件时进行拼写检查
autocmd BufWritePre * :call StripTrailingWhitespaces() " 去除多余的空格
autocmd FileType json IndentLinesDisable

autocmd Filetype verilog let g:AutoPairs['module'] = 'endmodule'
autocmd Filetype verilog let g:AutoPairs['case'] = 'endcase'
autocmd Filetype html let b:coc_root_patterns = ['.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs'] " 设置tailwind工作目录

" 函数别名
command! Rename :call Rename()

" ============================================================="

func! Fardo_del_buf()
    let l:curBufNr = bufnr('%')
    let l:curBufName = expand('%:t')

    exe 'bn'
    let l:nextBufNr = bufnr('%')
    exe 'bp'

    " 判断是否是FAR缓冲区
    if l:nextBufNr != l:curBufNr && l:curBufName =~ '^FAR'
        exec 'Fardo'
        exec 'bdel'
    endif
endfunc

" 删除除当前缓冲区以外的其他缓存区
func! D_allBuf()
    let l:curWinNr = winnr()
    if winbufnr(l:curWinNr) == 1
        ret
    endif
    let l:curBufNr = bufnr("%")
    exe "bn"
    let l:nextBufNr = bufnr("%")
    while l:nextBufNr != l:curBufNr
        exe "bn"
        exe "bdel ".l:nextBufNr
        let l:nextBufNr = bufnr("%")
    endwhile
endfunc

" 删除除当前缓冲区
func! D_oneBuf()
    let l:curWinNr = winnr()
    if winbufnr(l:curWinNr) == 1
        ret
    endif
    let l:curBufNr = bufnr("%")
    exe "bn"
    let l:nextBufNr = bufnr("%")
    if l:nextBufNr != l:curBufNr
        exe "bdel ".l:curBufNr
        exe "bp"
    endif
endfunc

func! AUTO_GEN_CODE()
    if &filetype == 'c'
        call setline(1, "#include <stdio.h>")
        call setline(2, "#include <stdlib.h>")
        call setline(3, "#include <string.h>")
        normal G
        normal o
        call setline(5, "int main(int argc, char *argv[]) {")
        call setline(6, "\tprintf(\"hello world\\n\");")
        call setline(7, "\treturn 0;")
        call setline(8, "}")
    elseif &filetype == 'cpp'
        call setline(1, "#include <iostream>")
        normal G
        normal o
        call setline(3, "int main(int argc, char *argv[]) {")
        call setline(4, "\tstd::cout << \"hello world\" << std::endl;")
        call setline(5, "\treturn 0;")
        call setline(6, "}")
    elseif &filetype == 'go'
        call setline(1, "package main")
        normal G
        normal o
        call setline(3, "import (")
        call setline(4, "\t\"fmt\"")
        call setline(5, ")")
        normal G
        normal o
        call setline(7, "func main() {")
        call setline(8, "\tfmt.Println(\"hello world\")")
        call setline(9, "}")
    elseif &filetype == 'rust'
        call setline(1, "fn main() {")
        call setline(2, "\tprintln!(\"hello world\");")
        call setline(3, "}")
    elseif &filetype == 'zig'
        call setline(1, "const std = @import(\"std\");")
        normal G
        normal o
        call setline(3, "pub fn main() void {")
        call setline(4, "\tstd.debug.print(\"hello world\", .{});")
        call setline(5, "}")
    elseif &filetype == 'sh' || &filetype == 'make'
        call setline(1, "#!/bin/sh")
        normal G
        normal o
    elseif &filetype == 'solidity'
        call setline(1, "// SPDX-License-Identifier: MIT")
        call setline(2, "pragma solidity ^0.8.0;")
        normal G
        normal o
    elseif &filetype == 'css'
        call setline(1, "* {")
        call setline(2, "   padding: 0;")
        call setline(3, "   margin: 0;")
        call setline(4, "}")
    elseif &filetype == 'html'
        call setline(1, "<!DOCTYPE html>")
        call setline(2, "<html lang=\"en\">")
        call setline(3, "  <head>")
        call setline(4, "    <meta charset=\"UTF-8\" />")
        call setline(5, "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />")
        call setline(6, "    <title></title>")
        call setline(7, "    <style></style>")
        call setline(8, "    <link rel=\"stylesheet\" href=\"css/style.css\" >")
        call setline(9, "  </head>")
        call setline(10, "  <body>")
        call setline(11, "    <script type=\"text/javascript\" ></script>")
        call setline(12, "  </body>")
        call setline(13, "</html>")
    endif
    if &filetype == 'vue'
        call setline(1, "<template>")
        call setline(2, "  <div>")
        call setline(3, "")
        call setline(4, "  </div>")
        call setline(5, "</template>")
        call setline(6, "")
        call setline(7, "<script>")
        call setline(8, "  export default {")
        call setline(9, "")
        call setline(10, "  }")
        call setline(11, "")
        call setline(12, "</script>")
        call setline(13, "")
        call setline(14, "<style scoped>")
        call setline(15, "")
        call setline(16, "</style>")
    endif
endfun

func! CODE_DEBUG()
    if &filetype == 'cpp' ||  &filetype == 'c'
        exec "w"
        exec "!g++ % -g -o /tmp/crun.elf"
        exec "!gdb /tmp/crun.elf && rm -f /tmp/crun.elf"
    endif
endfunc

func! CODE_RUN()
    exec "w"
    if &filetype == 'cpp'
        exec "!g++ % -o /tmp/cpprun.elf && /tmp/cpprun.elf && rm -f /tmp/cpprun.elf"
    elseif &filetype == 'c'
        exec "!gcc % -o /tmp/crun.elf && /tmp/crun.elf && rm -f /tmp/crun.elf"
    elseif &filetype == 'go'
        exec "!go run %"
    elseif &filetype == 'rust'
        exec "!rustc % -o /tmp/rrun.elf && /tmp/rrun.elf && rm -r /tmp/rrun.elf"
    elseif &filetype == 'zig'
        exec "!zig run %"
    elseif &filetype == 'haskell'
        exec "!ghc % -o /tmp/hrun.elf && /tmp/hrun.elf && rm -r /tmp/hrun.elf"
    elseif &filetype == 'javascript' || &filetype == 'typescript'
        exec "!deno run --allow-all %"
    elseif &filetype == 'html'
        exec "!brave % > /dev/null &"
    elseif &filetype == 'java'
        exec '!javac % && java %<'
    elseif &filetype == 'dart'
        exec '!dart run %'
    elseif &filetype == 'python'
        exec "!python3 %"
    elseif &filetype == 'qml'
        exec "!qmlscene %"
    elseif &filetype == 'vimwiki' ||  &filetype == 'markdown'
        exec 'silent !google-chrome-stable %'
    elseif &filetype == 'sh'
        exec "!bash %"
    elseif &filetype == 'nroff'
        exec "silent !groff -ms % -Tpdf > /tmp/groff.pdf; zathura /tmp/groff.pdf &"
    elseif &filetype == 'vim'
        exec 'source ~/.vimrc'
        exec 'PluginInstall'
    endif
endfunc

func! CODE_MAKE()
    if &filetype == 'go'
        setlocal makeprg=go\ build
    elseif &filetype == 'rust'
        setlocal makeprg=cargo\ build
    elseif &filetype == 'cpp' ||  &filetype == 'c'
        setlocal makeprg=make
    endif
    exec "make!"
    exec "cwindow 10"
    setlocal makeprg=make
endfunc

func! CODE_FORMAT()
    exec "w"

    if has('nvim')
        let l:filepath = expand('%:p')
    endif

    if &filetype == 'go'
        exec "!gofmt -w %"
    elseif &filetype == 'verilog'
        exec "!iStyle --style=kr -n %"
    elseif &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
        exec "!clang-format -style=\"{IndentWidth: 4}\" -i %"
    elseif &filetype == 'cmake'
        exec "!cmake-format -i %"
    elseif &filetype == 'python'
        exec "!black %"
    elseif &filetype == 'rust'
        exec "!rustfmt --edition=2021 %"
    elseif &filetype == 'slint'
        exec "!slint-lsp format % > /tmp/`basename %`"
        exec "!cat /tmp/`basename %` > %"
    elseif &filetype == 'zig'
        exec "!zig fmt %"
    elseif &filetype == 'solidity' || &filetype == 'gdmo' || &filetype == 'javascriptreact'
        exec "!prettier --write --tab-width=2 %"
    elseif &filetype == 'javascript' || &filetype == 'vue' || &filetype == 'typescript'|| &filetype == 'typescriptreact'
        exec "!prettier --write --tab-width=2 --single-quote %"
    elseif &filetype == 'html' || &filetype == 'css'
        exec "!prettier --write --tab-width=2 --single-quote %"
    elseif &filetype == 'html' || &filetype == 'json'
        exec "!prettier --write --tab-width=2 %"
    elseif &filetype == 'toml'
        exec "!taplo fmt %"
    elseif &filetype == 'nroff'
        exec "silent !groff -ms % -Tpdf > /tmp/groff.pdf"
    elseif &filetype == 'qml'
        exec "silent !qmlformat -in -l unix %"
    elseif &filetype == 'nix'
        exec "silent !nixfmt  %"
    else
        exec "call StripTrailingWhitespaces()"
    endif


    if has('nvim')
        exec "e ".l:filepath
    endif
endfunc

" 转换文件格式为utf8
func! File2UTF8()
    let l:filepath = expand('%:p')
    exec "!file2utf8.sh %:p"
    exec "bdel"
    exec "e ".l:filepath
endfunc

" 转换目录下的文件格式为utf8
func! Fold2UTF8()
    exec "!fold2utf8.sh %:p:h"
endfunc

" 转换文件大小
func! HumanSize(bytes) abort
    let l:bytes = a:bytes
    let l:sizes = ['B', 'KB', 'MB', 'GB']
    let l:i = 0
    while l:bytes >= 1024
        let l:bytes = l:bytes / 1024.0
        let l:i += 1
    endwhile
    return printf('%.1f%s', l:bytes, l:sizes[l:i])
endfun

" 显示帮助文档
func! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    exec 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunc

func! StripTrailingWhitespaces()
    let l:l = line(".") " 获取当前行
    let l:c = col(".") " 获取当前列
    %s/\s\+$//e " 去除空格
    call cursor(l:l, l:c) " 跳转到行列
endfunc

" 重命名文件,并删除源文件
func! Rename()
  let l:new_file_name = input('New filename: ')
  let l:full_path_current_file = expand("%:p")
  let l:new_full_path = expand("%:p:h")."/".l:new_file_name
  bd
  execute "!mv ".l:full_path_current_file." ".l:new_full_path
  execute "e ".l:new_full_path
endfunc

" 大写当前行的每个单词的首字母, 并居中, 移动到下一行
func! CapitalizeCenterAndMoveDown()
   s/\<./\u&/g   "Built‑in substitution capitalizes each word
   center        "Built‑in center command centers entire line
   +1            "Built‑in relative motion (+1 line down)
endfunc

" 生成时间戳
func! Timestamp()
    normal o
    let l:l = line(".") " 获取当前行
    let l:timestamp = strftime('%Y-%m-%d-%H:%M')
    let l:info = "[".l:timestamp."]"
    call setline(l:l, l:info)
endfunc

" 插入打赏提示
func! DaShang()
    let l:l = line(".") " 获取当前行
    let l:info = "如果觉得有帮助, 可以扫描右边的**微信打赏码**支持一下."
    call setline(l:l, l:info)
endfunc

" 中文字符转换为英文字符
func! Chinese2English()
    %s/，/, /g
    %s/。/. /g
    %s/（/(/g
    %s/）/)/g
    %s/？/? /g
    %s/：/: /g
    %s/；/; /g
    %s/“/"/g
    %s/、/, /g
endfunc

nmap <leader>tv :call TestVimScprit('argv_1', 2)<CR>
func! TestVimScprit(argv1, argv2)
    echo a:argv1
    echo a:argv2

    let l:integer = 10
    let l:str = '"hello world"'
    let l:list = [1, "two"]
    let l:dict = {'red': 1, 'blue': 2}
    exec "echo ".l:integer
    exec "echo ".l:str
    exec "echo l:list[1]"
    exec 'echo '.l:dict['blue']

    let l:result_string = ""
    if empty(result_string)
        echo "No result"
    endif

    let l:name = 'batman'
    if l:name ==? 'BATMAN' " 忽略大小写
        echo "I'm Batman"
    endif

    let l:list2 = ['red', 'yello']
    for l:l in l:list2
        echo l:l
    endfor

    for l:i in range(2)
        echo l:i
    endfor

    " for l:i in l:dict
    "     echo l:i
    "     " echo l:j
    " endfor

endfunc

"显示光标处内容所在函数
fun! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun


