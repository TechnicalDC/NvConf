return {
   'mbbill/undotree',
   config = function ()
      vim.keymap.set('n', '<leader>u', "<cmd>UndotreeToggle<cr>", {desc = "Toggle undo tree"})

      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_TreeNodeShape = ''
      vim.g.undotree_TreeVertShape = '│'
      vim.g.undotree_TreeSplitShape = '╯'
      vim.g.undotree_TreeReturnShape = '╮'
      vim.g.undotree_DiffCommand = "diff"
      vim.g.undotree_RelativeTimestamp = 1
      vim.g.undotree_HighlightChangedText = 1
   end
}
