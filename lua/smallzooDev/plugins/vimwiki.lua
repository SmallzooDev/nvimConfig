-- import gitsigns plugin safely
local setup, vimwiki = pcall(require, "vimwiki")
if not setup then
  return
end

vim.g.vimwiki_list = {{
    path = '~/vimWikiTest',
    syntax = 'markdown',
    ext= '.md',
}}

-- configure/enable gitsigns
vimwiki.setup()

