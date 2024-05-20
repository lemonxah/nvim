-- Replace word under cursor
vim.keymap.set(
	"n",
	"<leader>r",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "Replace word under cursor" }
)

vim.keymap.set("n", "so", ":e $MYVIMRC<CR>", { desc = "Open init.lua" })
vim.keymap.set("n", "H", vim.cmd.bprevious, { desc = "Buffer previous" }) -- ':bprev<CR>')
vim.keymap.set("n", "L", vim.cmd.bnext, { desc = "Buffer next" }) -- ':bprev<CR>')

-- Quit menu
vim.keymap.set("n", "<leader>`", ":b#<CR>", { desc = "Switch to last buffer" })
vim.keymap.set("n", "<leader>qb", vim.cmd.bd, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>qq", vim.cmd.qa, { desc = "Close All" })

vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Save buffer" })
vim.keymap.set("n", "<c-e>", vim.cmd.Hex, { desc = "Open Hex" })

-- keep indent while moving block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- join lines while keeping current position
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- keep line centered while jumping/searching
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous match" })

-- term exit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- paste over without losing current register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over" })

-- quickfix/locationlilst list (copen, lopen)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev Quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location List" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous Location List" })

-- delete into void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete into void" })

-- toggle inlay hints
vim.keymap.set(
	"n",
	"<leader>i",
	"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
	{ desc = "Toggle Inlay Hints" }
)

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Open Lazy plugin manager
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Open Mason ui
vim.keymap.set("n", "<leader>mm", "<cmd>Mason<cr>", { desc = "Mason" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>f/", builtin.live_grep, { desc = "All files Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find in Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "Find in Current Buffer" })

-- neo tree toggle
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer" })

-- better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
