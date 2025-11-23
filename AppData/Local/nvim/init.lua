-- Leader key
vim.g.mapleader = " "

-- =============================================================================
-- # PLUGINS
-- =============================================================================
local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Themes
Plug('felipeagc/fleet-theme-nvim')
Plug('https://gitlab.com/__tpb/acme.nvim')

-- Misc
Plug('itchyny/calendar.vim')

-- Search
Plug('universal-ctags/ctags')
Plug('junegunn/fzf', {['do'] = function() vim.fn['fzf#install']() end})
Plug('junegunn/fzf.vim')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-vsnip', {branch = 'main'})
Plug('hrsh7th/vim-vsnip')

-- Side file tree view
--Plug('preservim/nerdtree')
Plug('nvim-tree/nvim-tree.lua')
-- UI
Plug('itchyny/lightline.vim')
Plug('lervag/vimtex')

-- Semantic language support
Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

-- =============================================================================
-- # Neovide
-- =============================================================================
if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
-- vim.opt.guifont = "Cascadia Mono\\:h12"
 vim.opt.guifont = "Fixedsys Excelsior\\:h16"
-- vim.opt.guifont = "FixedSys:h17"
-- vim.opt.guifont = "Cascadia Mono:h11"
-- vim.opt.guifont = "JetBrains Mono:h13"
-- vim.opt.guifont = "IBM Plex Mono:h11"
-- vim.opt.guifont = "OCR-A:h12"
end

-- =============================================================================
-- # LSP
-- =============================================================================
local lspconfig = require("lspconfig")
local cmp = require("cmp")

--- LINE NUMBERS
vim.opt.number = true
vim.opt.relativenumber = true

-- LSP on_attach
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
  keymap('n', 'gD', vim.lsp.buf.declaration, opts)
  keymap('n', 'gd', vim.lsp.buf.definition, opts)
  keymap('n', 'gi', vim.lsp.buf.implementation, opts)
  keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  keymap('n', 'gs', vim.lsp.buf.document_symbol, opts)
  keymap('n', 'gS', vim.lsp.buf.workspace_symbol, opts)
  keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  keymap('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  keymap('n', '<space>D', vim.lsp.buf.type_definition, opts)
  keymap('n', '<space>rn', vim.lsp.buf.rename, opts)
  keymap('n', '<space>ca', vim.lsp.buf.code_action, opts)
  keymap('n', 'gr', vim.lsp.buf.references, opts)
  keymap('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end, opts)
end

-- Capabilities from nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Define server configs in vim.lsp.config
vim.lsp.config.gopls = {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.config.c3_lsp = {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.config.clangd = {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.config.rust_analyzer = {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      imports = { granularity = { group = "module" }, prefix = "self" },
      cargo = { buildScripts = { enable = true } },
      procMacro = { enable = true },
    }
  }
}

vim.lsp.config.cucumber_language_server = {
  cmd = { "cucumber-language-server", "--stdio" },
  filetypes = { "cucumber", "feature" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
  settings = { features = { "src/*.feature" } },
}

-- Enable all servers
vim.lsp.enable({
  "gopls",
  "c3_lsp",
  "clangd",
  "rust_analyzer",
  "cucumber_language_server",
})

-- =============================================================================
-- # Editor options
-- =============================================================================
-- TRANSPARENT BACKGROUND
--[=[
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd [[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
      highlight VertSplit guibg=NONE ctermbg=NONE
      highlight StatusLine guibg=NONE ctermbg=NONE
      highlight LineNr guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE
      highlight FloatBorder guibg=NONE ctermbg=NONE
      highlight NormalFloat guibg=NONE ctermbg=NONE
    ]]
  end,
})
vim.opt.termguicolors = false
]=]

vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

local function setup_acme()
    vim.opt.termguicolors = true
    vim.cmd("colorscheme acme")

	-- Set the base colorscheme
    vim.g.lightline = { colorscheme = "PaperColor" }

    -- LSP diagnostics
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#e06c75", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#e5c07b", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = "#56b6c2", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#61afef", bold = true })

    -- Colored underlines
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#ff5555" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = "#e5c07b" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = "#56b6c2" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = "#61afef" })
	
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#FFFFE0", fg = "#000000" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#FFFFE0", fg = "#0000FF" })
	vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Visual" })

    -- Variable colors
    vim.api.nvim_set_hl(0, "@variable", { fg = "#000000" })
    vim.api.nvim_set_hl(0, "@field",    { fg = "#000000" })
    vim.api.nvim_set_hl(0, "@property", { fg = "#000000" })
end

local function setup_fleet()
 vim.opt.termguicolors = true
 vim.cmd("colorscheme fleet")
 vim.g.lightline = { colorscheme = "wombat" }
end

-- Master function to switch themes
local function apply_theme(theme_name)
    if theme_name == "acme" then
        setup_acme()
    elseif theme_name == "fleet" then
        setup_fleet()
    else
        print("Unknown theme: " .. theme_name)
    end
end

apply_theme("acme")
-- apply_theme("fleet")

vim.o.langmenu = "en_US"
vim.env.LANG = "en_US"

vim.g.github_keyword_style = "normal"
vim.g.github_function_style = "normal"
vim.g.github_comment_style = "normal"

vim.cmd [[
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
if has('termguicolors')
  set termguicolors
endif
]]

vim.cmd("filetype plugin on")
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- =============================================================================
-- # Grep
-- =============================================================================
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- =============================================================================
-- # Keymaps
-- =============================================================================
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- NERD TREE
-- map('n', '<C-b>', ':NERDTreeToggle<CR>', opts)
-- map('n', '<C-f>', ':NERDTreeFind<CR>', opts)

-- NVIM TREE
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)

-- Open hotkeys
map('n', '<C-p>', ':FZF<CR>', opts)
map('n', '<C-,>', ':Rg<CR>', opts)
map('n', '<C-.>', ':Buffers<CR>', opts)

-- Quick save
map('n', '<leader>w', ':w<CR>', opts)

-- Toggle buffers and hidden characters
map('n', '<leader><leader>', '<c-^>', opts)
map('n', '<leader>,', ':set invlist<CR>', opts)
map('n', '<leader>q', 'g<c-g>', opts)
map('n', '<leader>m', 'ct_', opts)
map('n', '<leader>p', ':read !xsel --clipboard --output<CR>', opts)
map('n', '<leader>c', ':w !xsel -ib<CR><CR>', opts)

-- Tabs
map('n', 'th', ':tabprev<CR>', opts)
map('n', 'tl', ':tabnext<CR>', opts)
map('n', 'tk', ':tabnew<CR>', opts)

-- Line navigation
map('n', 'H', '^', opts)
map('n', 'L', '$', opts)
map('v', 'H', '^', opts)
map('v', 'L', '$', opts)

-- Ctrl+j/k as Esc
local modes = {'n','i','v','s','x','c','o','l','t'}
for _, m in ipairs(modes) do
  map(m, '<C-j>', '<Esc>', opts)
  map(m, '<C-k>', '<Esc>', opts)
end

-- Ctrl+h/f/l
map('i', '<C-h>', '<Bs>', opts)
map('n', '<C-h>', '<Bs>', opts)
map('i', '<C-l>', '<Del>', opts)
map('n', '<C-l>', '<Del>', opts)
map('i', '<C-f>', ':sus<CR>', opts)
map('v', '<C-f>', ':sus<CR>', opts)
map('n', '<C-f>', ':sus<CR>', opts)

-- Move by line
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)

-- Left/Right switch buffers
map('n', '<left>', ':bp<CR>', opts)
map('n', '<right>', ':bn<CR>', opts)

-- F1 disables help
map('n', '<F1>', '<Esc>', opts)
map('i', '<F1>', '<Esc>', opts)

-- =============================================================================
-- # Autocommands
-- =============================================================================
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufRead", { pattern = {"*.orig","*.pacnew"}, command = "set readonly" })
autocmd("InsertLeave", { pattern = "*", command = "set nopaste" })
autocmd("BufRead", { pattern = "*.plot", command = "set filetype=gnuplot" })
autocmd("BufRead", { pattern = "*.md", command = "set filetype=markdown" })
autocmd("BufRead", { pattern = "*.lds", command = "set filetype=ld" })
autocmd("BufRead", { pattern = "*.tex", command = "set filetype=tex" })
autocmd("BufRead", { pattern = "*.trm", command = "set filetype=c" })
autocmd("BufRead", { pattern = "*.xlsx.axlsx", command = "set filetype=ruby" })

-- =============================================================================
-- # Vimtex
-- =============================================================================
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = 'zathura'
vim.g.latex_indent_enabled = 1
vim.g.latex_fold_envs = 0
vim.g.latex_fold_sections = {}
vim.g.vimtex_compiler_latexmk = {
  build_dir = 'build',
  callback = 1,
  continuous = 1,
  executable = 'latexmk',
  hooks = {},
  options = { '-xelatex', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode' }
}

vim.cmd [[autocmd FileType latex,tex,markdown,md setlocal spell spelllang=pl]]

