" Key mappings
"
" My personal mappings for various commands and key combinations

" Smart save: Attempt to use SudoWrite if the file isn't writeable
nnoremap <expr> <C-s>
  \ expand('%') != '' && getfperm(expand('%')) != '' && !filewritable(expand('%')) ?
  \ ':write suda://%<CR>' : ':write<CR>'

" Remap Ctrl+C to be the same as escape without telling us to use :q to quit.
" the 'r' command is special cased to a NOP.
nnoremap r<C-c> <NOP>
nnoremap  <C-c> <NOP>
inoremap  <C-c> <Esc>
nnoremap  <C-c> <Esc>

" Disable EX mode
map Q <Nop>

""" Buffer Managment
nnoremap <silent>       <C-]>  :bnext<CR>
nnoremap <silent>       <C-[>  :bprev<CR>
nnoremap <silent><expr> <C-q> ':confirm '.(NoBuffersOpen() ? 'quit' : 'BD').'<CR>'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" fzf
nmap <Leader><Leader> :GFiles<CR>
nmap <Leader>p        :Files<CR>
nmap <Leader>b        :Buffers<CR>

""" Tabularizatins
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /^[^:]*:\zs/l0r1<CR>
vmap <Leader>a: :Tabularize /^[^:]*:\zs/l0r1<CR>

" Quick system copy and paste
nmap <Leader>y "+y
nmap <Leader>Y "+Y
vmap <Leader>y "+y

" Clear search / quickfix
nnoremap <silent><C-l> :nohlsearch<CR>:cclose<CR>:lclose<CR>

" Remove space
nmap <Leader>ds dipO<Esc>

" Don't move on *
nnoremap <silent> *
  \ :let stay_star_view = winsaveview()<CR>*
  \ :call winrestview(stay_star_view)<CR>

" Search for selected text
vnoremap <silent> * :<C-U>
 \ let old_reg = getreg('"')<Bar>
 \ let old_regtype = getregtype('"')<Bar>
 \ let stay_star_view = winsaveview()<CR>
 \ gvy/<C-R><C-R>=substitute(
 \ escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
 \ gV:call setreg('"', old_reg, old_regtype)<CR>
 \ :call winrestview(stay_star_view)<CR>

" Source line and selection in vim
vnoremap <leader>S y:execute @@<CR>:echo 'Sourced selection'<CR>
nnoremap <leader>S ^vg_y:execute @@<CR>:echo 'Sourced line'<CR>

" Repeat the lmast executed macro
nnoremap , @@

" Language server bindings
if match(&runtimepath, 'LanguageClient') != -1
  nnoremap <silent>gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
endif

" deoplete tab-complete
if match(&runtimepath, 'deoplete.nvim') != -1
  inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : ""
  inoremap <expr><C-h>   deoplete#mappings#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>    deoplete#mappings#smart_close_popup()."\<C-h>"
  inoremap <expr><CR>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif