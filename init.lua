-- base config
require('basic')

-- 快捷键映射
require("keybindings")

-- Packer 插件管理
require("plugins")

-- 自动命令
require("autocmds")

-- 主题设置
require("colorscheme")

-- 插件配置
require("plugin-config.nvim-tree")

require("plugin-config.bufferline")

require("plugin-config.lualine")

require("lsp.setup")
-- require'lspconfig'.clangd.setup{}

require("plugin-config.nvim-treesitter")

require("plugin-config.telescope")

require("plugin-config.nvim-autopairs")

require("plugin-config.symbols-outline")

require("plugin-config.comment")
