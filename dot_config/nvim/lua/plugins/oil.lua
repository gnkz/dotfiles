return {
    {
        "stevearc/oil.nvim",
        keys = {
            { "<leader>fo", "<cmd>lua require('oil').open()<cr>" }
        },
        config = function()
            require("oil").setup()
        end
    }
}
