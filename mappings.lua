-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- ["<leader>bD"] = {
    --   function()
    --     require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
    --   end,
    --   desc = "Pick to close",
    -- },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus

    -- Tabs
    ["<leader>T"] = { name = "Tabs" },
    ["<leader>Tn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>Tc"] = { "<cmd>tabclose<cr>", desc = "Close tab" },
    -- Telescope
    ["<leader>fR"] = { "<cmd>Telescope resume<cr>", desc = "Resume last search" },
    --- Buffer Nav
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>be"] = { "<cmd>echo expand('%:p')<cr>", desc = "Where is this buffer?" },
    ["<S-l>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<S-h>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    ["<leader>c"] = {
        function()
          local bufs = vim.fn.getbufinfo { buflisted = true }
          require("astronvim.utils.buffer").close(0)
          if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
        end,
        desc = "Close buffer",
    },
    -- Harpoon
    ["<leader>a"] = { function() require("harpoon.mark").add_file() end, desc = "Add file (Harpoon)" },
    ["<C-e>"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Quick Menu (Harpoon)" },
    ["<C-1>"] = { function() require("harpoon.ui").nav_file(1) end, desc = "Go to File 1 (Harpoon)" },
    ["<C-2>"] = { function() require("harpoon.ui").nav_file(2) end, desc = "Go to File 2 (Harpoon)" },
    ["<C-3>"] = { function() require("harpoon.ui").nav_file(3) end, desc = "Go to File 3 (Harpoon)" },
    ["<C-4>"] = { function() require("harpoon.ui").nav_file(4) end, desc = "Go to File 4 (Harpoon)" },
    -- Mine
    ["<leader>Q"] = { "<cmd>qa!<cr>", desc = "Quit All" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
