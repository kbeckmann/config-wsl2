return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "dockerfile",
        "gitignore",
        "lua",
        "make",
        "markdown",
        "python",
        "zig",
        "vim",
        "vimdoc",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        }
      }

    })
  end
}
