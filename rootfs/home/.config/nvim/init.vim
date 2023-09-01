set encoding=utf-8
lua require('config')

match RedundantSpaces /\s\+$/
highlight RedundantSpaces ctermbg=red guibg=red
