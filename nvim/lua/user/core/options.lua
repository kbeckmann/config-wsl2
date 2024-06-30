local opt = vim.opt


-- Draw nicer directory trees
vim.cmd("let g:netrw_liststyle = 3")

-- Disable comment continuation when pressing enter on all files
vim.api.nvim_create_autocmd("FileType", {
  command = "set formatoptions-=cro",
})

-- Cursor = line 0
opt.relativenumber = true

-- Show line number on selected line
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- opt.wrap = false
opt.wrap = true

opt.ignorecase = true -- Case-insensitive by default
opt.smartcase = true  -- Mixed case, force case search

-- Might be noisy..
opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start" -- Default

opt.clipboard:append("unnamedplus") -- Integrate with OS clipboard

opt.splitright = true
opt.splitbelow = true

