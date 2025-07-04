return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Configure linters per filetype
		lint.linters_by_ft = {
			-- 🟦 Web
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },

			-- 🟨 Python
			python = { "flake8" },

			-- 🟥 C/C++
			c = { "cpplint" },
			cpp = { "cpplint" },

			-- 🦀 Rust (requires manual integration, nvim-lint doesn't support rustfmt)
			-- Consider using `cargo check` or let LSP handle it

			-- ☕ Java (optional)
			-- No direct Java linter via nvim-lint; LSP does most of it (jdtls)

			-- 🐚 Bash
			sh = { "shellcheck" },
			bash = { "shellcheck" },

			-- 🐳 Docker
			dockerfile = {}, -- dockerfilelint is not supported in nvim-lint

			-- 📘 Markdown
			markdown = { "markdownlint" },
		}

		-- Auto run linting on save and certain events
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- Manual trigger keymap
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
