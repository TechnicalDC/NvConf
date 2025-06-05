return {
   "iamcco/markdown-preview.nvim",
	enabled = false,
   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
   build = "cd app && npm install",
   init = function()
      vim.g.mkdp_filetypes = { "markdown" }
   end,
   ft = { "markdown" },
}
