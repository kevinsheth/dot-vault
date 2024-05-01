-- OPTIONS ---

vim.opt.mouse = ""
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true -- wrap lines

--- KEY BINDINGS ---

lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<CR>"
lvim.keys.normal_mode["<tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>x"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<Esc>"] = ":noh<CR>"
lvim.keys.normal_mode["<leader>rr"] = ":RustRun<CR>"

--- PLUGINS ---

lvim.plugins = {
	{ "Vigemus/iron.nvim" },
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, cmd = "TroubleToggle" },
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
	},
	{
		"Exafunction/codeium.vim",
		enabled = true,
		config = function() end,
		lazy = false,
		event = "VeryLazy",
	},
}

lvim.builtin.treesitter.highlight.enable = true

lvim.lsp.automatic_servers_installation = false

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust-analyzer" })

lvim.use_icons = false

-- FORMATTING --

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "black", filetypes = { "python" } },
	{ name = "stylua", filetypes = { "lua" } },
	{ name = "alejandra", filetypes = { "nix" } },
	{ name = "rustfmt", filetypes = { "rust" } },
})

lvim.format_on_save.enabled = true

--- LINTING ---

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({ { command = "flake8", filetypes = { "python" } }, { command = "deadnix", filetypes = { "nix" } } })

--- LSP ---
local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})
