require "helpers/globals"

opt.splitright = true

opt.splitbelow = true

opt.clipboard = 'unnamedplus'

opt.completeopt = 'menuone,noselect'



cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]] -- off autocommenting
