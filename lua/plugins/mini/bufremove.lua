-- TODO see if there is a better bufremove
require('mini.bufremove').setup {}

map("n", "<C-x>", MiniBufremove.delete)
