vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open explorer" })
-- vim.keymap.set("n", "<leader>q", ":wqa<CR>", {})
vim.keymap.set("n", "<leader>wa", ":wa<CR>", {})

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic pop-up
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostic" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Moving between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
-- Doesn't work with arrow keys
--vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
--vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
--vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
--vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Terminal

local function open_bottom_split()
  vim.cmd("botright split | resize 12")
end

local terminal_buffer_number = nil

local function get_or_create_terminal_buffer()
  if terminal_buffer_number == nil or not vim.api.nvim_buf_is_valid(terminal_buffer_number) then
    open_bottom_split()
    vim.cmd(":terminal")
    terminal_buffer_number = vim.api.nvim_get_current_buf()
    print("Create new terminal buffer " .. terminal_buffer_number)
  else
    open_bottom_split()
    vim.api.nvim_set_current_buf(terminal_buffer_number)
    print("Switch to terminal buffer " .. terminal_buffer_number)
  end
  vim.cmd("startinsert")
  return terminal_buffer_number -- return valid number
end

local function open_and_send_to_terminal(text)
  local term_bufnr = get_or_create_terminal_buffer()
  vim.api.nvim_chan_send(vim.b[term_bufnr].terminal_job_id, text)
end

vim.keymap.set('n', "<leader>t", get_or_create_terminal_buffer, { desc = "open or switch to terminal" })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>:q<CR>', { desc = 'Exit terminal buffer' })

vim.keymap.set('n', '<leader>rn', function()
  local file_type = vim.bo.filetype
  local whole_file_path = vim.api.nvim_buf_get_name(0)
  local file_dir = vim.fn.fnamemodify(whole_file_path, ":h")
  local file_name = vim.fn.fnamemodify(whole_file_path, ":t")
  local binary = vim.fn.fnamemodify(file_name, ":r")

  if (file_type == "rust") then
    open_and_send_to_terminal("cargo run\n")
  elseif (file_type == "c") then
    open_and_send_to_terminal(
      "cd " .. file_dir ..
      "&& clang " .. file_name .. " -o " .. binary ..
      "&& ./" .. binary .. "\n"
    )
  else
    print("Run isn't configured for " .. file_type .. "!")
  end
end, {})
