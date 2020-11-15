''
set   cmdheight=2
set   colorcolumn=80
set   expandtab
set   hidden
set   number
set   relativenumber 
set   shortmess+=c
set   signcolumn=yes
set   tabstop=2
set   updatetime=300
set nowrap
set nowritebackup

for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor
''
