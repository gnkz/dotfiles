return {
    {
        "cbochs/grapple.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = {
            { "<leader>ta", "<cmd>GrappleToggle<cr>" },
            { "<leader>tl", "<cmd>GrapplePopup tags<cr>" },
        }
    }
}
