{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./telescope.nix
    ./treesitter.nix
    ./nvim-tree.nix
    #    ./codeium.nix
    ./lsp.nix
    ./cmp.nix
    ./lazy.nix
    ./friendly-snippets.nix
    ./luasnip.nix
    ./comment.nix
    ./nvim-autopairs.nix
    ./gitsigns.nix
    ./which-key.nix
    ./project-nvim.nix
    ./lualine.nix
    ./navic.nix
    ./dap.nix
    ./alpha.nix
    #    ./toggleterm.nix
    #    ./illuminate.nix
    #    ./indent-blankline.nix
  ];

  config = {
    colorschemes.tokyonight.enable = true;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      {
        action = "<cmd>NvimTreeToggle><CR>";
        key = "<C-n>";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
    ];
  };

  options = {
    cmdheight = 2;
    guifont = "monospace:h17";
    shiftwidth = 2;
    tabstop = 2;
    relativenumber = true;
    wrap = true;
  };
}
