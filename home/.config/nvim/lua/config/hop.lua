require("hop").setup {
  keys = "etovxqpdygfblzhckisuran",
  term_seq_bias = 0.5,
}

local map = vim.api.nvim_set_keymap
map("n", "<leader>hw", ":HopWord<CR>", { silent = true })
map("n", "<leader>hw", ":HopLine<CR>", { silent = true })
