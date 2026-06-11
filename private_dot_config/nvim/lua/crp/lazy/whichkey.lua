return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    preset = "helix",
    delay = 100,
    icons = {
      breadcrumb = "»",
      separator = "🌵",
      group = "+",
    },
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    layout = {
      align = "left",
      height = { min = 4, max = 25 },
      spacing = 3,
      width = { min = 20, max = 50 },
    },
    show_help = true,
    show_keys = true,
  }
}
