lvim.plugins = {
  {"vimsence/vimsence"},
  {"fatih/vim-go"},
  {"folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"}
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "folke/persistence.nvim",
      event = "VimEnter",
      module = "persistence",
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
          options = { "buffers", "curdir", "tabpages", "winsize" },
        }
    end,
  },
  {"folke/tokyonight.nvim"}, {
           "ray-x/lsp_signature.nvim",
           config = function() require"lsp_signature".on_attach() end,
           event = "InsertEnter"
  },
  {
    "folke/trouble.nvim",
      cmd = "TroubleToggle",
  },
  {
    "filipdutescu/renamer.nvim",
      branch = 'master',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function()
        require("renamer").setup {
          title = '+×',
          show_refs = true,
          padding = {
            top = 0,
            bottom = 0,
            left = 0,
            right = 0,
          },
      }
      end,
  },
  {
    'wfxr/minimap.vim',
    run = "cargo install --locked code-minimap",
    cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function ()
      vim.cmd ("let g:minimap_width = 10")
      vim.cmd ("let g:minimap_auto_start = 1")
      vim.cmd ("let g:minimap_auto_start_win_enter = 1")
    end,
  },
}

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 6
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.colorcolumn = "99999"
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.foldmethod = "manual"
vim.opt.foldexpr = ""
vim.opt.guifont = "JetBrains Mono Nerd Font:h17"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 100
vim.opt.title = true
vim.opt.titlestring = "%<%F%=%l/%L - LunarVim"
-- vim.opt.undodir = "~/.config/lvim/undo"
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.spelllang = "en"
vim.opt.spell = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

lvim.builtin.nvimtree.quit_on_open = 1
lvim.builtin.lualine.style = "default"
lvim.lsp.diagnostics.virtual_text = true

lvim.builtin.dashboard.custom_header = {
  "▄ •▄ ▄▄▄   ▄· ▄▌• ▌ ▄ ·. ·▄▄▄▄•▪   ▐   ▄▪",
  "█▌▄▌▪▀▄ █·▐█▪██▌·██ ▐███▪▪ .█▌·██ •█▌ ▐█",
  "▐▀▀▄·▐▀▀▄ ▐█▌▐█▪▐█ ▌▐▌▐█·▄█▀▀ •▐█·▐█▐▌ ▌",
  "▐█.█▌▐█•█▌ ▐█▀·.██ ██▌▐█▌█▌▪  ▐█▌ ██▐█ ▌",
  "·▀  ▀.▀  ▀  ▀ • ▀▀  █▪▀▀▀·▀▀▀▀•▀▀ ▀▀ ██"
}

local status = {
  ["NORMAL"]  = "I'm so normal that I ain't",
  ["INSERT"]  = "Thou hit key, ic add bytes",
  ["COMMAND"] = "Thee command mec",
  ["VISUAL"]  = "Vision/sight/perception",
  ["V-LINE"]  = "very visual line",
  ["V-BLOCK"] = "very visual block",
  ["REPLACE"] = "Thou hit key, ic replace bytes",
  ["SELECT"]  = "Thou hit key, ic select bytes",
}

lvim.builtin.lualine.sections.lualine_a = {
  {
    "mode",
    fmt = function(mode)
          return status[mode]
    end
  },
}

lvim.builtin.bufferline.options = {
      numbers = "ordinal",
      view = "multiwindow",
      number = "superscript",
      modified_icon = '●',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 25, -- prefix used when a buffer is deduplicated
      tab_size = 20,
      diagnostics ="nvim_lsp",
      show_buffer_close_icons = false,
      show_close_icon = false,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and "" or ""
        return " " .. icon .. count
      end,
      separator_style = "thin",
}

lvim.builtin.lualine.options.theme = "tokyonight"

lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope live_grep<CR>", "Find In Folder" }
lvim.builtin.which_key.mappings["m"] = { "<cmd>MinimapToggle<CR>", "Toggle Minimap" }

lvim.builtin.which_key.mappings["a"] = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" }

lvim.builtin.which_key.mappings["h"] = {
  name = "Hop",
  l = { "<cmd>HopLine<cr>", "Hop to Line" },
  w = { "<cmd>HopWord<cr>", "Hop to Word" },
  c = { "<cmd>HopChar1<cr>", "Hop to Character" }
}

lvim.builtin.which_key.mappings["T"] = {
  name = "Trouble Diagnostics",
  t = { "<cmd>TodoTelescope<cr>", "Toggle Todo Telescope Menu" },
  T = { "<cmd>TodoTrouble<cr>", "Toggle Todo Trouble Menu" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Show Quickfix(s)" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
}
lvim.builtin.which_key.mappings["t"] = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Toggle Trouble Diagnostics" }


lvim.builtin.which_key.mappings["l"]["r"] = {"<cmd>lua require('renamer').rename{empty=true,}<cr>", "Rename"}

lvim.transparent_window = true

vim.api.nvim_set_keymap('', '<up>', '<nop>',{ noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<down>', '<nop>',{ noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<left>', '<nop>',{ noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<right>', '<nop>',{ noremap = true, silent = true})

lvim.keys.normal_mode["gh"] = "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>"

lvim.log.level = "warn"

lvim.format_on_save = true
lvim.lint_on_save = true

lvim.colorscheme = "tokyonight"

lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  {
    exe = "black",
    filetypes = {"python"},
    args = {}
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "flake8",
    filetypes = {"python"}
  },
}

