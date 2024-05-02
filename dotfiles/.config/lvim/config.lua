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
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, cmd = "TroubleToggle" },
	{
		"Exafunction/codeium.vim",
		enabled = true,
		config = function() end,
		lazy = false,
		event = "VeryLazy",
	},
}

lvim.builtin.treesitter.highlight.enable = true

lvim.use_icons = false

lvim.lsp.automatic_servers_installation = false
-- FORMATTING --
