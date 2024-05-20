neotree.setup({
        filesystem = {
                -- list of directories to ignore
                ignore = { ".git", "node_modules", ".cache" },
                -- list of files to ignore
                hidden = { ".gitignore", ".gitmodules", ".DS_Store" },
                -- show hidden files
                show_hidden = false,
                -- width of the window
                width = 30,
                hijack_netrw_behavior = "open_default",
        },
})
