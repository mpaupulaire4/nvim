-- map("n", "<C-x>", MiniBufremove.delete)
return {
  'echasnovski/mini.bufremove',
  branch = 'stable',
  keys = {
    {
      '<c-x>',
      function()
        MiniBufremove.delete()
      end
    },
  },
  config = function()
    require('mini.bufremove').setup()
  end
}
