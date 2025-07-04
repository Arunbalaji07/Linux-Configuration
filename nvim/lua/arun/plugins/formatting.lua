return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- 🟦 Web & Frontend
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				graphql = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				-- Angular uses TypeScript + HTML

				-- 🟨 Python
				python = { "isort", "black" },

				-- 🟥 Lua
				lua = { "stylua" },

				-- 🟦 C/C++ & Rust
				c = { "clang_format" },
				cpp = { "clang_format" },
				rust = { "rustfmt" },

				-- 🟩 Java
				java = { "google_java_format" },

				-- 🐧 Shell / Config
				bash = { "shfmt" },
				sh = { "shfmt" },
				dockerfile = { "dockfmt" },
			},

			-- Format on save
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		-- Manual format keybinding
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
