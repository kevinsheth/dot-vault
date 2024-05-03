{
  plugins = {
    lsp-format.enable = true;

    lsp = {
      enable = true;

      servers = {
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

        nil_ls = {
          enable = true;
        };

        ocamllsp = {
          enable = true;
        };
      };
    };

    none-ls = {
      enable = true;
      enableLspFormat = true;
      sources = {
        formatting = {
          alejandra.enable = true;
          stylua.enable = true;
          ocamlformat.enable = true;
        };
      };
    };
  };
}
