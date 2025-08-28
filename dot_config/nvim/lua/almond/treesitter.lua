require('nvim-treesitter.configs').setup {
  -- Install these parsers by default
  ensure_installed =
  {
    "lua", "vim", "vimdoc", "javascript", "typescript", "python",
    "rust", "c", "go", "html", "css", "json", "yaml", "toml",
    "markdown", "bash"
  },
  auto_install = true, -- Automatically install missing parsers

  -- modules, all enabled by default
  -- for each one, set `disable = { "array", "of", "langs" } to disable it for that lang
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
    },
  },
  textobjects = {
    enable = true,
  },
}
