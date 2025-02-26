function install-typescript-lsp
    if command -v typescript-language-server
        typescript-language-server --version
    else
        npm install -g typescript-language-server typescript
    end
end
