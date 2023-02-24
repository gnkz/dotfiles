function CreateBranch()
	local branch_name
	vim.ui.input({ prompt = "Branch name: " }, function(input)
		branch_name = input
	end)

	if (branch_name == nil or branch_name == "") then
		return
	end

	vim.cmd("G checkout -b " .. branch_name)
	vim.cmd("G push -u origin " .. branch_name)
end

return {
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs",  "<cmd>G<cr>",                  desc = "Git status" },
			{ "<leader>gd",  "<cmd>Gdiff<cr>",              desc = "Git diff" },
			{ "<leader>gb",  "<cmd>G blame<cr>",            desc = "Git blame" },
			{ "<leader>gP",  "<cmd>G push<cr>",             desc = "Git push" },
			{ "<leader>gp",  "<cmd>G pull<cr>",             desc = "Git pull" },
			{ "<leader>gcb", "<cmd>lua CreateBranch()<cr>", desc = "Create branch" },
			{ "<leader>cvc", "<cmd>G commit --verbose<cr>", desc = "Git commit" },
		}
	}
}
