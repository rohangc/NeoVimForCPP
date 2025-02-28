return {
  "rbong/vim-flog",
  lazy = true,
  --cmd = {"Flog", "Flogsplit", "Floggit"},
  cmd = {"Flog"},
  dependencies = {
    "tpope/vim-fugitive",
  },
}
