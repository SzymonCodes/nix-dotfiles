return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Personal",
        path = "~/Documents/Obsidian_Vaults/Zettelkasten",
      },
    },
    disable_frontmatter = true,
    ui = {
      enable = false,
    },
    templates = {
      folder = "Templates",
    },
    vim.keymap.set("n", "<leader>t", ":ObsidianTemplate<CR>")
  },
}
