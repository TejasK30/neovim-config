-- keymaps
vim.g.mapleader = " "
-- Keymap to remove ^M characters (carriage returns)
vim.api.nvim_set_keymap('n', '<leader>rm', ':%s/\\r//g<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "1", "$")
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Copy selected text with 'c' in visual mode
vim.keymap.set('v', 'c', '"+y', { noremap = true, silent = true })

-- Select the entire line with 'l' in normal mode
vim.keymap.set('n', 'l', 'V', { noremap = true, silent = true })

-- Normal mode: Cut the current line to the register
vim.api.nvim_set_keymap('n', 'x', '"_dd', { noremap = true, silent = true })
-- Visual mode: Cut selected text to the register
vim.api.nvim_set_keymap('v', 'x', '"_d', { noremap = true, silent = true })
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.wrap = true  -- Enable line wrapping
vim.opt.shiftwidth = 2         -- Number of spaces to use for each indentation level
vim.opt.tabstop = 2            -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 2        -- Make tabs behave like spaces
-- Keybindings for managing splits
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit<CR>', { noremap = true, silent = true }) -- Vertical split
vim.api.nvim_set_keymap('n', '<leader>hs', ':split<CR>', { noremap = true, silent = true })  -- Horizontal split
vim.api.nvim_set_keymap('n', '<leader>cs', ':close<CR>', { noremap = true, silent = true })  -- Close current split
-- Keybindings for managing tab
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true }) -- Open new tab
vim.api.nvim_set_keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true }) -- Close tab
vim.api.nvim_set_keymap('n', '<leader>to', ':tabonly<CR>', { noremap = true, silent = true }) -- Close all other tabs
vim.api.nvim_set_keymap('n', '<leader>tp', ':tabprevious<CR>', { noremap = true, silent = true }) -- Go to previous tab
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnext<CR>', { noremap = true, silent = true }) -- Go to next tab
-- Tab for indent
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Tab for normal mode (optional, if you want to indent whole lines using Tab in normal mode)
  vim.api.nvim_set_keymap('n', '<Tab>', '>>_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<_', { noremap = true, silent = true })
-- Cut all (ax)
vim.api.nvim_set_keymap('n', 'ax', 'ggVGd', { noremap = true, silent = true })

-- Copy all (ac)
vim.api.nvim_set_keymap('n', 'ac', 'ggVGy', { noremap = true, silent = true })

-- Clear search highlighting (<leader>c)
vim.api.nvim_set_keymap('n', '<leader>c', ':nohlsearch<CR>', { noremap = true, silent = true })
-- Move a line up (Shift+K) and down (Shift+J)
vim.api.nvim_set_keymap('n', '<S-K>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-J>', ':m .+1<CR>==', { noremap = true, silent = true })

-- Move a visual-selected block up (Shift+K) and down (Shift+J)
vim.api.nvim_set_keymap('v', '<S-K>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-J>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Move a line up (Shift+K) and down (Shift+J)
vim.api.nvim_set_keymap('n', '<S-K>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-J>', ':m .+1<CR>==', { noremap = true, silent = true })

-- Move a visual-selected block up (Shift+K) and down (Shift+J)
vim.api.nvim_set_keymap('v', '<S-K>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-J>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
  -- Set 'y' to redo changes
vim.api.nvim_set_keymap('n', 'y', '<C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'y', '<C-r>', { noremap = true, silent = true })

vim.api.nvim_buf_set_keymap(0, 'n', 'er', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap=true, silent=true })

-- Set 'n' for next search result and 'p' for previous search result
vim.api.nvim_set_keymap('n', 'n', 'n', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'p', 'N', { noremap = true, silent = true })

-- lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "failed to clone lazy.nvim:\n", "errormsg" },
      { out, "warningmsg" },
      { "\npress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
local opts = {}
require("lazy").setup("plugins")
--color scheme
vim.cmd.colorscheme "catppuccin"


