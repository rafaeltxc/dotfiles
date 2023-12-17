## NeoVim
Starting nvim will trigger the plugins installation. Once the installation is complete, exiting it and starting nvim again, should open it ready for use.

**Note**: Mason will install the configured LSP's on the first installation, yet, you may receive a nullls plugin error, as linters/formatters will need to be manually installed.

## Configuring
### Shortcuts
There are two main files that can modified, [core/keymaps.lua](https://github.com/rafaeltxc/nvim-config/blob/main/nvim/lua/core/keymaps.lua) for custom keymaps, and [utils/plugins-keymaps.lu](https://github.com/rafaeltxc/nvim-config/blob/main/nvim/lua/utils/plugins-keymaps.lua) for the keymaps that will be loaded by WhichKey.

A minor amount of keymaps are located inside [lua/plugins/](https://github.com/rafaeltxc/nvim-config/blob/main/nvim/lua/plugins/) folder, in its own plugin file.

### LSP's
All installed language servers can be found in: [utils/mason-ensure-installed.lua](https://github.com/rafaeltxc/nvim-config/blob/main/nvim/lua/utils/mason-ensure-installed.lua). This file is responsible for managing the active languages in nvim_lsp.

Any new desired language server must be pointed into the file, and Mason will take care of the installation, otherwise it will make no difference, as nvim_lsp uses the table inside the file to configure the languages defaults.

**Treesitter**

All Treesitter languages to be installed, are located in the [utils/treesitter-ensure-installed.lua](https://github.com/rafaeltxc/nvim-config/blob/main/nvim/lua/utils/treesitter-ensure-installed.lua) file, modify the file with your needed languages.

### Languages Custom Configuration
Inside the [plugins/lsp/settings/](https://github.com/rafaeltxc/nvim-config/blob/main/nvim/lua/utils/settings) folder, will be located the files for the optional language configurations. Create a file with the server name.lua, and configure it as you need.

Check [server-configuration.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) for more information about configuring each available language.
