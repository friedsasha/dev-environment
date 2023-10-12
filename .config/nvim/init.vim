set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let g:CommandTPreferredImplementation='lua'
let g:cargo_command = "Dispatch cargo {cmd}"

let mapleader = "," " map leader to comma
call plug#begin()
Plug 'timonv/vim-cargo'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vijaymarupudi/nvim-fzf' " requires the nvim-fzf library
Plug 'vijaymarupudi/nvim-fzf-commands'

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

" Display
Plug 'itchyny/lightline.vim'
Plug 'lifepillar/vim-solarized8'

" Autocompletion
"Plug 'ervandew/supertab'


" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

" Searchability
Plug 'nvim-lua/plenary.nvim'  " Required by telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

"" Plugin config:

" We don't want per-filetype plugins running - they blow away omnifunc and
" other stuff set below.
filetype plugin off
filetype indent on

lua <<EOF
local lsp = require('lsp-zero').preset({
  name = 'recommended',
})

 require("mason").setup()
 require('mason.settings').set({
	ui = {
		border = 'rounded'
	}
})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = true,
    }
)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
EOF

" Re-read a file if it's been modified outside vim
set autoread
set updatetime=100

" Prefer Unix file endings to Windows ones.
" (This is a default on a Linux system but not on a Windows one)
set fileformats=unix,dos

"" FZF!
"noremap <leader>f :lua require('fzf-commands').files()<CR>

command! -nargs=1 Rg call luaeval('require("fzf-commands").rg(_A)', <f-args>)
noremap <leader>g :call luaeval('require("fzf-commands").rg(_A)', expand("<cword>"))<CR>

" Neovim: When in the terminal, use Ctrl+] to escape the terminal,
" then seek to the end of the last non-whitespace.
if (has('nvim'))
    tnoremap <C-]> <C-\><C-n>G$:call search('\S', 'b')<CR>$
endif

"" Tame searching/moving:

" searching all lower-case is case insensitive, but searching with one or more
" characters uppercase will yield a case-sensitive search
set ignorecase
set smartcase

" Apply substitutions globally
set gdefault

set incsearch
set showmatch
set hlsearch

nnoremap <leader><space> :noh<cr>

" Use tab key match bracket pair
nnoremap <tab> %
vnoremap <tab> %
