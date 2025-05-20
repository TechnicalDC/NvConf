local dashboards = {}
dashboards.chafa = {
   {
      section = "terminal",
      cmd = "bash -c 'chafa ~/.config/nvim/res/coffee.jpg --format symbols --symbols vhalf --size 60x15 --stretch; sleep .1'",
      height = vim.o.columns >= 120 and 15 or 10,
      padding = 1,
   },
   {
      pane = 2,
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
   },
}
dashboards.default = {
   { section = "header" },
   { section = "keys", gap = 1 },
   { section = "startup" },
}
return dashboards
