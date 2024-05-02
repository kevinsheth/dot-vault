{
  plugins.lsp = {
    enable = true;

    servers = {
      lua-ls = {
        enable = true;
        settings.telemetry.enable = false;
      };

      nil_ls = {
        enable = true;
      };
    };
  };
}
