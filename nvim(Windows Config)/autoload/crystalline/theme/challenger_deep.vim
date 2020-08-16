function! crystalline#theme#challenger_deep#set_theme() abort
    call crystalline#generate_theme({
        \ 'NormalMode': [[8, 6], ['#100E23', '#aaffe4']],
        \ 'InsertMode': [[8, 1], ['#100E23', '#ff8080']],
        \ 'VisualMode': [[8, 3], ['#100E23', '#ffe9aa']],
        \ 'ReplaceMode': [[8, 3], ['#100E23', '#ffe9aa']],
        \ '': [[8, 14], ['#100E23', '#63f2f1']],
        \ 'Inactive': [[8, 5], ['#100E23', '#c991e1']],
        \ 'Fill': [[15, 8], ['#F3F3F3', '#100E23']],
        \ 'Tab': [[8, 14], ['#100E23', '#63f2f1']],
        \ 'TabType': [[8, 3], ['#100E23', '#ffe9aa']],
        \ 'TabSel': [[8, 6], ['#100E23', '#aaffe4']],
        \ 'TabFill': [[15, 8], ['#F3F3F3', '#100E23']],
        \ })
endfunction
