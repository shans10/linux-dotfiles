""" Settings
let g:bracey_refresh_on_save = 1                   " Reload the webpage when buffer is written
let g:bracey_server_allow_remote_connections = 1   " Allow other machines on the network to view the webpage
let g:bracey_server_port = 7777                    " Bracey server port

""" Keybindings
map <leader>br :Bracey<CR><CR>
map <leader>bt :BraceyStop<CR>
