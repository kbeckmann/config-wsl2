local wezterm = require 'wezterm'

return {
  font = wezterm.font 'Fira Code Medium',
--  font = wezterm.font 'Fira Mono Medium',


  -- color_scheme = "flexoki-dark",
  -- color_scheme = "Catppuccin Mocha",

  enable_tab_bar = false,
  canonicalize_pasted_newlines = "LineFeed",

  default_prog = {"wsl.exe"},

  set_environment_variables = {
    COLORTERM="truecolor",
  },
}
