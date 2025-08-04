-- Check if which-key is available
local has_which_key, which_key = pcall(require, "which-key")
if not has_which_key then
  print("Warning: which-key not found. Key binding help won't be available.")
  return
end

-- Set up which-key with error handling
local setup_ok, _ = pcall(which_key.setup, {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  win = {
    border = "rounded",
    padding = { 2, 2, 2, 2 },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
  },
})

if not setup_ok then
  print("Error setting up which-key. Key binding help won't work correctly.")
  return
end

-- Add additional commands to which-key (ones that don't already exist)
require('which-key').add({
  { "<leader>l", group = "LSP" },
  { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
  { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
  { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
  { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>w", group = "Wiki" },
  { "<leader>f", group = "Find" },
})
