return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        priority = 99999,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "json",
                    "typescript",
                    "javascript",
                    "nix",
                    "lua",
                    "fish",
                    "solidity",
                    "rust",
                    "markdown",
                    "markdown_inline",
                    "vim",
                    "regex",
                    "bash"
                },
            })
        end
    }
}
