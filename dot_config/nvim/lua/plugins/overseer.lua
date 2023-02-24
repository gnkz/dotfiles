return {
	{
		"stevearc/overseer.nvim",
		dependencies = {
			{ "akinsho/toggleterm.nvim", version = "*", config = true }
		},
		config = function()
			local overseer = require("overseer")

			require("overseer").setup({
				strategy = "toggleterm",
				templates = {
					"builtin",
					"user.forge_fmt",
					"user.forge_test",
					"user.forge_build",
				},
			})

			vim.api.nvim_create_user_command("OverseerRestartLast", function()
				local tasks = overseer.list_tasks({ recent_first = true })
				if vim.tbl_isempty(tasks) then
				vim.notify("No tasks found", vim.log.levels.WARN)
				else
					overseer.run_action(tasks[1], "restart")
				end
			end, {})
		end
	}
}
