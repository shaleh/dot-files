function install-pylsp
    if command -v pylsp
        pylsp --version
    else
        pip install python-lsp-server[rope] python-lsp-black python-lsp-isort
    end
end
