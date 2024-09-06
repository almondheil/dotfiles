-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  --
  -- Theme
  --

  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require("night-owl").setup()
      vim.cmd.colorscheme("night-owl")
    end,
  },

  --
  -- LSP
  --

  { "simrat39/rust-tools.nvim" },
}

lvim.builtin.lualine.style = "default"

-- Change night owl theme settings
--@param options Config|nil
local night_owl = require("night-owl")
night_owl.setup({
    bold = true,
    italics = true,
    underline = true,
    undercurl = true,
    transparent_background = false,
})


-- LSP setup for rust-tools
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- OCAML SETTINGS
-- Indent
vim.cmd('set rtp^=/home/almond/.opam/default/share/ocp-indent/vim')
-- LSP
local ml = require("lspconfig")
ml.ocamllsp.setup({})

-- Colorscheme (set at end of file)
lvim.colorscheme = "night-owl"
