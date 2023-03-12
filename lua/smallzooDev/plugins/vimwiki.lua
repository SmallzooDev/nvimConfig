-- import gitsigns plugin safely
local setup, vimwiki = pcall(require, "vimwiki")
if not setup then
  return
end

-- configure/enable gitsigns
vimwiki.setup()
