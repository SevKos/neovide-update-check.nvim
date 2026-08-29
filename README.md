# neovide-update-check.nvim

A small Neovim plugin that checks whether a newer version of [Neovide](https://neovide.dev/) is available.

It compares the version of the currently running Neovide instance against the latest release published on GitHub and displays the result using Neovim notifications.

The plugin only operates when Neovim is running inside Neovide.

## Requirements

- Neovim 0.11+
- Neovide
- `curl`

## Installation

### lazy.nvim

Add the plugin to your Lazy.nvim configuration:

```lua
return {
  {
    "sevkos/neovide-update-check.nvim",
    lazy = false,
    opts = {},
  },
}
```

The plugin uses the following default keymap:

```text
<leader>pn
```

Pressing it manually checks for a newer Neovide version.

## Configuration

The default configuration is:

```lua
{
  keymap = "<leader>pn",
  check_on_startup = false,
}
```

You can change the keymap during installation:

```lua
return {
  {
    "sevkos/neovide-update-check.nvim",
    lazy = false,
    opts = {
      keymap = "<leader>nv",
    },
  },
}
```

Now `<leader>nv` will check for updates instead.

### Disable the keymap

If you don't want the plugin to create a keymap:

```lua
return {
  {
    "sevkos/neovide-update-check.nvim",
    lazy = false,
    opts = {
      keymap = false,
    },
  },
}
```

## Usage

The update check can also be triggered directly from Lua:

```lua
require("neovide-update-check").check_update()
```

For example:

```lua
vim.keymap.set("n", "<leader>nu", function()
  require("neovide-update-check").check_update()
end, {
  desc = "Check Neovide for updates",
})
```

## Notifications

When an update is available:

```text
Neovide update available: 0.16.1 → 0.16.2
```

When the current version is already the latest:

```text
You have the latest version: 0.16.2
```

The plugin also displays a notification when the update check starts.

## License

This project is licensed under the GNU General Public License v3.0.
