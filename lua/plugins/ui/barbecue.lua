require("barbecue").setup({
   theme = "auto",
   attach_navic = true,
   show_navic = true,
   create_autocmd = true,
   show_dirname = true,
   show_basename = true,
   show_modified = true,
   include_buftypes = { "" },
   exclude_filetypes = { "netrw", "toggleterm" },
   modifiers = {
      ---Filename modifiers applied to dirname.
      ---
      ---See: `:help filename-modifiers`
      ---
      ---@type string
      dirname = ":~:.",

      ---Filename modifiers applied to basename.
      ---
      ---See: `:help filename-modifiers`
      ---
      ---@type string
      basename = "",
   },
   ---Get modified status of file.
   ---
   ---NOTE: This can be used to get file modified status from SCM (e.g. git)
   ---
   ---@type fun(bufnr: number): boolean
   modified = function(bufnr) return vim.bo[bufnr].modified end,

   ---Get leading custom section contents.
   ---
   ---NOTE: This function shouldn't do any expensive actions as it is run on each
   ---render.
   ---
   ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
   lead_custom_section = function() return " " end,

   ---@alias barbecue.Config.custom_section
   ---|string # Literal string.
   ---|{ [1]: string, [2]: string? }[] # List-like table of `[text, highlight?]` tuples in which `highlight` is optional.
   ---
   ---Get custom section contents.
   ---
   ---NOTE: This function shouldn't do any expensive actions as it is run on each
   ---render.
   ---
   ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
   custom_section = function() return " " end,


   ---Whether context text should follow its icon's color.
   ---
   ---@type boolean
   context_follow_icon_color = false,

   symbols = {
      modified = " ",
      ellipsis = "…",
      separator = "",
   },

   kinds = {
      File = "",
      Module = "",
      Namespace = "",
      Package = "",
      Class = "",
      Method = "",
      Property = "",
      Field = "",
      Constructor = "",
      Enum = "",
      Interface = "",
      Function = "",
      Variable = "",
      Constant = "",
      String = "",
      Number = "",
      Boolean = "",
      Array = "",
      Object = "",
      Key = "",
      Null = "",
      EnumMember = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
   },
})
