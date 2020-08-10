" =============================================================================
" Filename: autoload/lightline/colorscheme/challenger_deep.vim
" Author: shans10
" =============================================================================

" Normal colors
let s:black = [ '#100e23', 0 ]
let s:red = [ '#ff8080', 1 ]
let s:green = [ '#95ffa4', 2 ]
let s:yellow = [ '#ffe9aa', 3 ]
let s:blue = [ '#91ddff', 4 ]
let s:magenta = [ '#c991e1', 5 ]
let s:cyan = [ '#aaffe4', 6 ]
let s:white = [ '#cbe3e7', 7 ]

" Bold / Brighter colors
let s:black2 = [ '#565575', 8 ]
let s:red2 = [ '#ff5458', 9 ]
let s:green2 = [ '#62d196', 10 ]
let s:yellow2 = [ '#ffb378', 11  ]
let s:blue2 = [ '#65b2ff', 12 ]
let s:magenta2 = [ '#906cff', 13 ]
let s:cyan2 = [ '#63f2f1', 14 ]
let s:white2 = [ '#a6b3cc', 15 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:cyan, 'bold' ], [ s:black, s:cyan2 ] ]
let s:p.normal.right = [ [ s:black, s:cyan2 ], [ s:black, s:cyan ], [ s:black, s:cyan2 ] ]
let s:p.insert.left = [ [ s:black, s:green, 'bold' ], [ s:black, s:green2 ] ]
let s:p.insert.right = [ [ s:black, s:green2 ], [ s:black, s:green ], [ s:black, s:green2 ] ]
let s:p.visual.left = [ [ s:black, s:yellow, 'bold' ], [ s:black, s:yellow2 ] ]
let s:p.visual.right = [ [ s:black, s:yellow2 ], [ s:black, s:yellow ], [ s:black, s:yellow2 ] ]
let s:p.replace.left = [ [ s:black, s:red, 'bold' ], [ s:black, s:red2 ] ]
let s:p.replace.right = [ [s:black, s:red2 ], [ s:black, s:red ], [ s:black, s:red2 ] ]
let s:p.inactive.left = [ [ s:black, s:magenta, 'bold' ], [ s:black, s:magenta2 ] ]
let s:p.inactive.right = [ [ s:black, s:magenta ], [ s:black, s:magenta2 ] ]
let s:p.normal.middle = [ [ s:white, s:black ] ]
let s:p.normal.error = [ [ s:black, s:red, 'bold' ] ]
let s:p.normal.warning = [ [ s:black, s:yellow, 'bold' ] ]
let s:p.inactive.middle = [ [ s:white, s:black ] ]

let s:p.tabline.left = [ [ s:black, s:cyan2 ] ]
let s:p.tabline.tabsel = [ [ s:black, s:cyan, 'bold' ] ]
let s:p.tabline.middle = [ [ s:white, s:black ] ]
let s:p.tabline.right = [ [ s:black, s:red ] ]

let g:lightline#colorscheme#challenger_deep#palette = lightline#colorscheme#flatten(s:p)
