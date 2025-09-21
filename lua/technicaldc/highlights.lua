local hl = vim.api.nvim_set_hl
local palette = require("mini.hues").make_palette()
local config = require("technicaldc.config")
local is_transparent = config.transparent

-- print(vim.inspect(palette))

if is_transparent then
   hl(0, "Normal",      { fg = palette.fg,     bg = "None" })
   hl(0, "NormalFloat", { fg = palette.fg,     bg = "None" })
   hl(0, "NormalNC",    { fg = palette.fg_mid, bg = "None" })
   hl(0, "FloatBorder", { fg = palette.fg_mid2, bg = "None" })
   hl(0, "FloatTitle",  { fg = palette.fg,     bg = "None" })
   hl(0, "PmenuKind",   { bg = "None" })
   hl(0, "MiniPickMatchRanges", { fg = palette.green, bg = "None"})

   hl(0, "StatusLine",            { fg = palette.fg_mid, bg = "None" })
   hl(0, "StatusLineNC",          { fg = palette.fg_mid, bg = "None" })
   hl(0, "StatusLineTerm",        { fg = palette.fg_mid, bg = "None" })
   hl(0, "StatusLineTermNC",      { fg = palette.fg_mid, bg = "None" })
   hl(0, "StatusLineFilename",    { bg = palette.bg_mid, fg = "None" })
   hl(0, "StatusLineFilenameSep", { bg = palette.bg_mid, fg = "None" })
   hl(0, "WinBar",                { fg = palette.fg_mid, bg = "None" })
   hl(0, "WinBarNC",              { fg = palette.fg_mid, bg = "None" })
else
   hl(0, "StatusLine",            { fg = palette.fg_mid, bg = palette.bg_mid  })
   hl(0, "StatusLineNC",          { fg = palette.fg_mid, bg = palette.bg_mid  })
   hl(0, "StatusLineTerm",        { fg = palette.fg_mid, bg = palette.bg_mid  })
   hl(0, "StatusLineTermNC",      { fg = palette.fg_mid, bg = palette.bg_mid  })
   hl(0, "StatusLineFilename",    { bg = palette.bg_mid, fg = palette.fg_mid  })
   hl(0, "StatusLineFilenameSep", { bg = palette.bg_mid, fg = palette.fg_mid2 })
   hl(0, "WinBar",                { fg = palette.fg_mid, bg = palette.bg      })
   hl(0, "WinBarNC",              { fg = palette.fg_mid, bg = palette.bg      })
   hl(0, "FloatBorder",              { fg = palette.bg_edge, bg = palette.bg_edge })
   hl(0, "FloatTitle",               { fg = palette.fg,      bg = palette.bg_mid2 })
end

hl(0, "StatusLineModeNormal",   { bg = palette.blue,    fg = palette.bg_mid })
hl(0, "StatusLineModeVisual",   { bg = palette.yellow,  fg = palette.bg_mid })
hl(0, "StatusLineModeInsert",   { bg = palette.green,   fg = palette.bg_mid })
hl(0, "StatusLineModeReplace",  { bg = palette.orange,  fg = palette.bg_mid })
hl(0, "StatusLineModeCommand",  { bg = palette.red,     fg = palette.bg_mid })
hl(0, "StatusLineModeTerminal", { bg = palette.azure,   fg = palette.bg_mid })
hl(0, "StatusLineModeConfirm",  { bg = palette.cyan,    fg = palette.bg_mid })
hl(0, "StatusLineMode",         { bg = palette.bg_mid2, fg = palette.fg_mid })

-- BUILT-IN
hl(0, "Msg", { link = "StatusLine" })
hl(0, "Pmenu", { bg = palette.bg_edge })
hl(0, "WinSeparator",             { fg = palette.bg_mid })
hl(0, "PmenuSel",                 { fg = palette.fg, bg = palette.bg_mid2 })
hl(0, "DiagnosticUnderlineError", { undercurl = true })
hl(0, "DiagnosticUnderlineHint",  { undercurl = true })
hl(0, "DiagnosticUnderlineInfo",  { undercurl = true })
hl(0, "DiagnosticUnderlineOk",    { undercurl = true })
hl(0, "DiagnosticUnderlineWarn",  { undercurl = true })

-- BLINK-CMP
hl(0, "BlinkCmpSource", { fg = palette.fg_mid2 })

-- MINI-STARTER
hl(0, "MiniStarterHeader", { fg = palette.fg_edge})
hl(0, "MiniStarterItem", { fg = palette.fg_mid2})
hl(0, "MiniStarterSection", { fg = palette.fg_edge})
hl(0, "MiniStarterItemPrefix", { fg = palette.fg_mid})

-- MINI-FILES
hl(0, "MiniFilesTitle", { link = "FloatTitle" })
hl(0, "MiniFilesTitleFocused", { link = "FloatTitle" })
hl(0, "MiniFilesBorderModified", { link = "FloatBorder" })

-- MINI-PICK
hl(0, "MiniPickPrompt",       { link = "FloatTitle" })
hl(0, "MiniPickPromptPrefix", { link = "FloatTitle" })
hl(0, "MiniPickPromptCaret",  { link = "FloatTitle" })
hl(0, "MiniPickMatchCurrent", { link = "PmenuSel" })

hl(0, "MiniNotifyBorder", { link = "FloatBorder" })
