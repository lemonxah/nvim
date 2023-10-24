vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)

vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dp")

-- amazing copy paste with system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>e", function()
  vim.cmd.TroubleToggle()
end)
vim.keymap.set("v", "<leader>e", function()
  vim.cmd.TroubleToggle()
end)

vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", "0gt")

-- switching to last active tab
vim.api.nvim_create_autocmd("TabLeave", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>tabn ' .. vim.api.nvim_tabpage_get_number(0) .. '<CR>',
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<C-l>', '<cmd>tabn ' .. vim.api.nvim_tabpage_get_number(0) .. '<CR>',
      { noremap = true, silent = true })
  end
})

-- tabs
vim.keymap.set("n", "<leader>tn", function()
  vim.cmd.tabnew()
  vim.cmd.NvimTreeFocus()
end)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)
