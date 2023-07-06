return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    require("alpha")
    require("alpha.term")
    local dashboard = require "alpha.themes.dashboard"

    local button = require("astronvim.utils").alpha_button
    dashboard.section.buttons.val = {
      button("LDR n", "  New File  "),
      button("LDR f f", "  Find File  "),
      button("LDR f o", "󰈙  Recents  "),
      button("LDR f w", "󰈭  Find Word  "),
      button("LDR f '", "  Bookmarks  "),
      button("LDR S l", "  Last Session  "),
    }

    local width = 46
    local height = 20
    dashboard.section.terminal.command = "cat | " .. os.getenv("HOME") .. "/.config/nvim/lua/user/render.sh"
    dashboard.section.terminal.width = width
    dashboard.section.terminal.height = height
    dashboard.section.terminal.opts.redraw = true

    dashboard.section.header.opts.hl = "DashboardHeader"
    dashboard.section.header.val = "Welcome Back, Jose"

    dashboard.config.layout = {
      { type = "padding", val = 1 },
      dashboard.section.terminal,
      { type = "padding", val = 5 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
}
