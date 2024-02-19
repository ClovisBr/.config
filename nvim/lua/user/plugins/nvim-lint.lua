return {
	"mfussenegger/nvim-lint",
	event = "BufWritePre",
	config = function()
		require("lint").linters_by_ft = {
			python = {
				"flake8",
				"mypy",
				"pylint",
			},
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			pattern = { "*.py" },
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
