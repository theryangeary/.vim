set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:vimrc = "~/.vimrc"
execute "source" g:vimrc

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'Font', 'Source Code Variable Medium 11')
endif
