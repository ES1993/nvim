local options = {
  o = {
    shell = "zsh",
    timeout = true,
    timeoutlen = 300,
  },
  opt = {
    -- line
    number = true,
    relativenumber = true,
    wrap = true,
    cursorline = true,
    linebreak = true,

    -- tab
    tabstop = 2,
    shiftwidth = 2,
    expandtab = true,

    --indent
    copyindent = true,
    smartindent = true,
    autoindent = true,
    breakindent = true,
    preserveindent = true,

    --search
    ignorecase = true,
    smartcase = true,
    infercase = true,

    --appearance
    termguicolors = true,
    background = "dark",
    signcolumn = "yes",
    showmode = false,
    showtabline = 2,
    pumheight = 10,
    mouse = "",

    --backspace
    backspace = "indent,eol,start",

    --clipboard
    clipboard = "unnamedplus",

    --split
    splitright = true,
    splitbelow = true,

    --scroll
    scrolloff = 8,
    sidescrolloff = 8,

    --file
    fileencoding = "utf-8",
    writebackup = false,
    undofile = true,

    --keydown
    timeoutlen = 500,

    --fold
    foldenable = true,
    foldlevel = 99,
    foldlevelstart = 99,
    foldcolumn = "1",

    --others
    history = 100,
    cmdheight = 0,
    completeopt = { "menu", "menuone", "noselect" },
  },
  g = {
    mapleader = " ",
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
  },
}

for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end
