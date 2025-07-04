return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- import mason-tool-installer
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- configure language servers to install
		mason_lspconfig.setup({
			ensure_installed = {
				-- 🔹 Frontend / Web
				"html", -- HTML
				"cssls", -- CSS
				"ts_ls", -- JavaScript / TypeScript
				"tailwindcss", -- Tailwind CSS
				"svelte", -- Svelte
				"angularls", -- Angular
				"emmet_ls", -- Emmet (HTML/CSS snippets)
				"graphql", -- GraphQL
				"prismals", -- Prisma

				-- 🔹 Lua (for Neovim)
				"lua_ls", -- Lua

				-- 🔹 Backend / Systems
				"pyright", -- Python
				"jdtls", -- Java
				"rust_analyzer", -- Rust
				"clangd", -- C/C++

				-- 🧪 Optional / Common
				"jsonls", -- JSON
				"yamlls", -- YAML
				"dockerls", -- Dockerfile
				"bashls", -- Bash
				"marksman", -- Markdown
				"eslint", -- ESLint (LSP version)
			},
		})

		-- configure formatters and linters to install
		mason_tool_installer.setup({
			ensure_installed = {
				-- ✅ JavaScript / TypeScript / React / Svelte / Angular
				"prettier", -- Formatter
				"eslint_d", -- Linter

				-- ✅ Python
				"black", -- Formatter
				"isort", -- Import sorter
				"flake8", -- Linter

				-- ✅ Lua
				"stylua", -- Formatter

				-- ✅ C / C++
				"clang-format", -- Formatter
				"cpplint", -- Linter

				-- ✅ Rust
				"rustfmt", -- Formatter

				-- ✅ Java
				"google-java-format", -- Formatter (optional)

				-- ✅ Bash
				"shfmt", -- Formatter
				"shellcheck", -- Linter

				-- ✅ JSON / YAML / Markdown
				"markdownlint", -- Markdown linter
			},
		})
	end,
}
