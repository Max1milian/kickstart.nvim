-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Function keys to save and edit files
vim.keymap.set({ 'n', 'i', 'v' }, '<F1>', '<ESC>:w<Enter>', { desc = 'saving file' })
vim.keymap.set({ 'n', 'i', 'v' }, '<F2>', '<ESC>:wq<Enter>', { desc = 'saving file and exiting file' })
vim.keymap.set({ 'n', 'i', 'v' }, '<F3>', '<ESC>:qa!<Enter>', { desc = 'exiting all windows without saving' })
vim.keymap.set({ 'n', 'i', 'v' }, '<F4>', '<ESC>:q!<Enter>', { desc = 'exiting without saving' })

--cmake commands to create and build projects
vim.keymap.set({ 'n', 'i', 'v' }, '<F6>', '<ESC>:vsplit | term cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug<Enter><S-G>', { desc = 'creating the project' })
vim.keymap.set({ 'n', 'i', 'v' }, '<F7>', '<ESC>:vsplit | term cmake --build build --parallel 16<Enter><S-G>', { desc = 'building the CMake project' })
vim.keymap.set({ 'n', 'i', 'v' }, '<F8>', '<ESC>:vsplit | term rm -rf build<Enter><S-G>', { desc = 'deleting the build project' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
