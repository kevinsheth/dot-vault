{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./telescope.nix
    ./treesitter.nix
    ./nvim-tree.nix
    #    ./codeium.nix
    ./lsp.nix
    ./none-ls.nix
    ./cmp.nix
    ./lsp-format.nix
    ./lazy.nix
    ./friendly-snippets.nix
    ./luasnip.nix
  ];

  config = {
    colorschemes.gruvbox.enable = true;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      {
        action = "<cmd>NvimTreeToggle><CR>";
        key = "<C-n>";
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
