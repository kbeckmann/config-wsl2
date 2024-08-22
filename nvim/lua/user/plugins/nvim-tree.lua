return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    local api = require("nvim-tree.api")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function my_on_attach(bufnr)
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      local function open_tab_no_switch()
        local tabpage = vim.api.nvim_get_current_tabpage()
        api.node.open.tab()
        vim.api.nvim_set_current_tabpage(tabpage)
      end

      -- use all default mappings
      api.config.mappings.default_on_attach(bufnr)
      -- override defaults
      vim.keymap.set('n', '<leader><CR>', api.node.open.tab, opts('Open in tab'))
      vim.keymap.set('n', '<leader>t', open_tab_no_switch, opts('Open in tab without switching to it'))
    end

    nvimtree.setup({
      on_attach = my_on_attach,
      view = {
        width = 35,
        --        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end
}
