{pkgs, ...}: {
  programs.firefox = {
    enable = true;

    profiles.kevin = {
      id = 0;
      name = "kevin";
      isDefault = true;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        onepassword-password-manager
      ];
    };
  };
}
