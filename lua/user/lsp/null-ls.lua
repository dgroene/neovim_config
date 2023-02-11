local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
    null_ls.builtins.diagnostics.phpcs.with({ -- Change how the php linting will work
            extra_args = { "--standard=~/.composer/vendor/drupal/coder/coder_sniffer/Drupal" },
        }),
    null_ls.builtins.formatting.phpcbf.with({ -- Use the local installation first
            extra_args = { "--standard=~/.composer/vendor/drupal/coder/coder_sniffer/Drupal" },
        }),
    null_ls.builtins.diagnostics.twigcs.with({ -- Change how the php linting will work
            extra_args = { "--twig-version=2" },
        }),
	},
})

mason_null_ls.setup({})
