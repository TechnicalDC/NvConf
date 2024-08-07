return {
   'ThePrimeagen/git-worktree.nvim',
   enabled = false,
   config = function ()
      require("git-worktree").setup()
      require("telescope").load_extension("git_worktree")
   end
}
