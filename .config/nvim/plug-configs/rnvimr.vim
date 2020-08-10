" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

let g:rnvimr_draw_border = 1

""" Make Ranger to be hidden after picking a file
let g:rnvimr_pick_enable = 1

""" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_bw_enable = 1

""" Keybindings
nmap <leader>rr :RnvimrToggle<CR>
nmap <leader>rs :RnvimrSync<CR>

let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'

let g:rnvimr_presets = [
            \ {'width': 0.800, 'height': 0.800}]
