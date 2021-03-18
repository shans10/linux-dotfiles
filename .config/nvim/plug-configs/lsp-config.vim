" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> gn <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> gp <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Source neovim-compe config
luafile ~/.config/nvim/luafiles/compe-config.lua

" Source Lsp configs
luafile ~/.config/nvim/luafiles/lsp-configs/clangd-lsp.lua
luafile ~/.config/nvim/luafiles/lsp-configs/vim-lsp.lua
luafile ~/.config/nvim/luafiles/lsp-configs/python-lsp.lua
luafile ~/.config/nvim/luafiles/lsp-configs/bash-lsp.lua
