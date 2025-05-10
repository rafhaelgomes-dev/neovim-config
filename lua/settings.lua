vim.cmd([[ let extension = expand('%:e') ]])
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[ set encoding=utf8 ]])
vim.cmd([[ set nu! ]])
vim.cmd([[ set mouse=a ]])
vim.cmd([[ set wildmenu ]])
vim.cmd([[ set confirm ]])
vim.cmd([[ set incsearch ]])
vim.cmd([[ set title ]])
vim.cmd([[ set t_Co=256 ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set guicursor= ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ syntax on ]])
vim.cmd([[ set bg=dark ]])
vim.cmd([[ set termguicolors ]])
vim.cmd([[ colorscheme onedark ]])

require('onedark').setup {
  style = 'darker'
}
require('onedark').load()
require('staline').setup {
    defaults = {
        expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
        left_separator  = "",
        right_separator = "",
        full_path       = false,
        line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.

        fg              = "#000000",  -- Foreground text color.
        bg              = "none",     -- Default background is transparent.
        inactive_color  = "#303030",
        inactive_bgcolor = "none",
        true_colors     = false,      -- true lsp colors.
        font_active     = "none",     -- "bold", "italic", "bold,italic", etc

        mod_symbol      = "  ",
        lsp_client_symbol = " ",
        lsp_client_character_length = 12, -- Shorten LSP client names.
        branch_symbol   = " ",
        cool_symbol     = " ",       -- Change this to override default OS icon.
        null_ls_symbol = "",          -- A symbol to indicate that a source is coming from null-ls
    },
    mode_colors = {
        n = "#2bbb4f",
        i = "#986fec",
        c = "#e27d60",
        v = "#4799eb",   -- etc..
    },
    mode_icons = {
        n = " ",
        i = " ",
        c = " ",
        v = " ",   -- etc..
    },
    sections = {
        left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
        mid  = { 'file_name' },
        right = { 'cool_symbol','right_sep_double', '-line_column' },
    },
    inactive_sections = {
        left = { 'branch' },
        mid  = { 'file_name' },
        right = { 'line_column' }
    },
    special_table = {
        NvimTree = { 'NvimTree', ' ' },
        packer = { 'Packer',' ' },        -- etc
    },
    lsp_symbols = {
        Error=" ",
        Info=" ",
        Warn=" ",
        Hint="",
    },
}

-- settings.lua

-- Configuração do LSP (Language Server Protocol)
local nvim_lsp = require('lspconfig')

-- Configuração para cada servidor LSP
local servers = { 'ts_ls', 'gopls', 'pyright', 'jdtls', 'clangd' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = function(client, bufnr)
      -- Configuração do mapeamento de teclas LSP
      local opts = { noremap=true, silent=true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    end,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

-- Configuração do autocompletar com nvim-cmp
local cmp = require'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Usando LuaSnip
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },        -- Fonte LSP
    { name = 'luasnip' },         -- LuaSnip
  }, {
    { name = 'buffer' },          -- Fonte buffer
  })
}

-- LSP Signature (mostrar assinatura da função)
require("lsp_signature").on_attach()

-- Ícones de LSP com lspkind
require("lspkind").init()

-- Configuração para o Mason (gerenciador de servidores LSP)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"ts_ls", "gopls", "pyright", "jdtls", "clangd"},
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Configuração do Telescope
require('telescope').setup{
  defaults = {
    -- Definindo opções padrão para o Telescope
    prompt_position = "top",      -- Posição do prompt de pesquisa
    sorting_strategy = "ascending",  -- Estratégia de ordenação
    layout_strategy = "horizontal",  -- Layout da janela
    layout_config = {
      horizontal = { mirror = false },  -- Configuração do layout horizontal
    },
    file_ignore_patterns = {"*.git/*", "node_modules/*"}  -- Ignorar arquivos e pastas
  }
}

vim.cmd[[colorscheme tokyonight-night]]
