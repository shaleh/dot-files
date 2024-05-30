function install-pylsp
    if command -v pylsp
        pylsp --version
    else
        pip install python-lsp-server
    end
end
