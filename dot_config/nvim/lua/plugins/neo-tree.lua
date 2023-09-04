return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        cmd = { "Neotree", "NeoTreeToggle", "NeoTreeFloatToggle" },
        keys = {
            { "<leader>ft", "<cmd>NeoTreeFloatToggle<cr>" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        }
    }
}
