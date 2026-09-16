vim.g.mapleader = ' '  

require "lazy-bootstrap"
local lazy = require("lazy")
lazy.setup("plugins")




require('base/search')
require('base/lines')
require('base/other')
require('base/colorscheme')

require('keys/main')
require('keys/alias')
