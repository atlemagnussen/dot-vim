# atlemagnussen vim setup

# Plugin manager
Plug - https://github.com/junegunn/vim-plug

- will auto install plug and the plugins  on first vim load after cloning to .vim

# Plugins
- [NerdTree](https://github.com/scrooloose/nerdtree)
- [ALE](https://github.com/dense-analysis/ale)
- [YouCompleteMe (Follow Install Instructions)](https://github.com/ycm-core/YouCompleteMe)
- [FZF](https://github.com/junegunn/fzf.vim)

- [Lightline](https://github.com/itchyny/lightline.vim)

- [Vim-ES6](https://github.com/isRuslan/vim-es6)
- [Mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils)
- [Vim-snipmate](https://github.com/garbas/vim-snipmate)
- [Vim-fugitive](https://github.com/tpope/vim-fugitive)

## Plugins that needs extra work to install
### YouCompleteMe
- need `build-essential cmake python3` as a prerequisite on the system. 
- need `npm install typescript` for js autocompletion

Then install and build ycm by running:
```sh
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --cs-completer --js-completer
```

### FZF
- need `fzf` installed on system.
