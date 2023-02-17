local opt = vim.opt

-- line numbers : 줄 표시
opt.relativenumber = true
opt.number = true

-- tabs & indentation : 들여쓰기, 러스트 목적이므로 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- 대쉬가 한 단어로 인식되게 하는 옵션
