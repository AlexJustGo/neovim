vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)

-- symbols-outline
map("n", "tb", ":SymbolsOutline<CR>", opt)

-- bufferline
-- 左右Tab切换
-- 被占了 <C-h>
-- map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "bp", ":BufferLinePick<CR>", opt)
--"moll/vim-bbye"
map("n", "bd", ":Bdelete!<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    -- ["<C-j>"] = "move_selection_next",
    -- ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    -- ["<C-u>"] = "preview_scrolling_up",
    -- ["<C-d>"] = "preview_scrolling_down",
  },
}

-- LSP
pluginKeys.mapLSP = function(mapbuf)
	mapbuf('n', 'gd',		vim.lsp.buf.definition)
	mapbuf('n', 'gi',		vim.lsp.buf.implementation)
	mapbuf('n', 'gr',		vim.lsp.buf.references)
	mapbuf('n', 'gt',		vim.lsp.buf.type_definition)
	mapbuf('n', '<leader>rn',	vim.lsp.buf.rename)
	mapbuf('n', 'gh',		vim.lsp.buf.hover)
	mapbuf('n', 'ga',		":ClangdSwitchSourceHeader<CR>")
	mapbuf('n', '<space>f', function() vim.lsp.buf.format { async = true } end)
end

-- diff user/kernel config
function setkernel()
	vim.o.tabstop = 8
	vim.o.softtabstop = 8
	-- >> << 时移动长度
	vim.o.shiftwidth = 8
	-- 空格替代tab
	vim.o.expandtab = false
end
function setuser()
	vim.o.tabstop = 4
	vim.o.softtabstop = 4
	-- >> << 时移动长度
	vim.o.shiftwidth = 4
	-- 空格替代tab
	vim.o.expandtab = true
end
map("n", "<leader>ks", ":lua setkernel()<CR>", opt)
map("n", "<leader>us", ":lua setuser()<CR>", opt)

return pluginKeys
