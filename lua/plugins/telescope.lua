return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			-- Custom function to open files in a new tab or switch to the tab if already open
			local open_in_new_tab = function(prompt_bufnr)
				local selected_entry = action_state.get_selected_entry()
				local filename = selected_entry.value

				-- Close the Telescope window
				actions.close(prompt_bufnr)

				-- Check if the file is already open in any tab
				for tabnr = 1, vim.fn.tabpagenr("$") do
					local winnr = vim.fn.tabpagewinnr(tabnr)
					local bufnr = vim.fn.winbufnr(winnr)
					if vim.fn.bufname(bufnr) == filename then
						-- If file is already open, switch to that tab
						vim.cmd("tabnext " .. tabnr)
						return
					end
				end

				-- If the file is not open, open it in a new tab
				vim.cmd("tabnew " .. filename)
			end

			-- Setup Telescope configuration to ignore node_modules in search
			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--glob=!.git/",
						"--glob=!node_modules/", -- Ignore node_modules globally for search
					},
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "--glob", "!.git/", "--glob", "!node_modules/" }, -- Exclude node_modules from file search
					},
				},
			})

			-- Keymaps for searching with Telescope
			vim.keymap.set("n", "<leader><leader>", function()
				builtin.find_files({
					attach_mappings = function(_, map)
						map("i", "<CR>", open_in_new_tab) -- Open in a new tab
						return true
					end,
				})
			end, {})

			vim.keymap.set("n", "<leader>g", function()
				builtin.git_files({
					attach_mappings = function(_, map)
						map("i", "<CR>", open_in_new_tab) -- Open in a new tab
						return true
					end,
				})
			end, {})

			vim.keymap.set("n", "<leader>h", function()
				builtin.help_tags({
					attach_mappings = function(_, map)
						map("i", "<CR>", open_in_new_tab) -- Open in a new tab
						return true
					end,
				})
			end, {})

			vim.keymap.set("n", "<leader>s", function()
				builtin.grep_string({
					search = vim.fn.input("Grep > "),
					attach_mappings = function(_, map)
						map("i", "<CR>", open_in_new_tab) -- Open in a new tab
						return true
					end,
				})
			end)

			-- Keymap to close all buffers
			vim.keymap.set("n", "<leader>q", function()
				vim.cmd("bufdo bd")
			end, { noremap = true, silent = true })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- additional options can go here
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
