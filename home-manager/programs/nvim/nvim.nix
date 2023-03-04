{ pkgs, ... }:

{
  enable = true;
  vimAlias = true;

  extraConfig = ''    

    """"""""""""""""""""""""""""""""""""""
    " => Settings
    """""""""""""""""""""""""""""""""""""""
    set clipboard=unnamedplus
    set number
    set encoding=UTF-8
    set autoindent
    set smartindent
    set nocompatible
    set mouse=a
    set guicursor+=n:hor20-Cursor/lCursor
    
    """"""""""""""""""""""""""""""""""""""
    " => File explorer   
    """""""""""""""""""""""""""""""""""""""
    :nnoremap <C-e> :NERDTree<CR>
    :nnoremap <C-p> :FZF<CR>

    """""""""""""""""""""""""""""""""""""""
    " => Theme
    """""""""""""""""""""""""""""""""""""""
    syntax on
    set t_Co=256
    "colorscheme sonokai

    """""""""""""""""""""""""""""""""""""""
    " => Statusbar
    """""""""""""""""""""""""""""""""""""""
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    
    """""""""""""""""""""""""""""""""""""""
    " => Code sytling
    """""""""""""""""""""""""""""""""""""""
    set tabstop=4
    set shiftwidth=4
    set expandtab

    """""""""""""""""""""""""""""""""""""""
    " => Keymaps
    """""""""""""""""""""""""""""""""""""""

    " reload vim.rc
    nnoremap <Leader>vr :source $MYVIMRC<CR>	" reload

    """
    " Auto reformat clang
    """
    autocmd FileType c ClangFormatAutoEnable
    let g:clang_format#auto_format = 1
    let g:clang_format#detect_style_file = 1
    let g:clang_format#enable_fallback_style = 0

    """
    " Rainbow parenth
    """
    let g:rainbow_active = 1
  '';

  plugins = with pkgs.vimPlugins; [ 
    vim-polyglot
    vim-airline
    vim-airline-themes
    lightline-vim
    vim-devicons
    vim-clang-format
    ayu-vim
    nerdtree
    fzf-vim
    coc-nvim
    coc-pairs
    coc-yaml
    DoxygenToolkit-vim
    rainbow
  ];
}
