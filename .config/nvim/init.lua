vim.keymap.set("i","jk","<Esc>")
vim.g.clipboard = {
  name = 'wl-clipboard',
  copy = {
    ['+'] = 'wl-copy --foreground --type text/plain',
    ['*'] = 'wl-copy --foreground --primary --type text/plain',
  },
  paste = {
    ['+'] = 'wl-paste --no-newline',
    ['*'] = 'wl-paste --primary --no-newline',
  },
  cache_enabled = 1,
}
    
vim.o.clipboard = 'unnamedplus'
vim.opt.number = true
vim.wo.relativenumber = true

require("config.lazy")



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
