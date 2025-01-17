local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
local hover = null_ls.builtins.hover

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    -- formatters
    formatting.prettierd.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.isort,
    formatting.stylua,
    formatting.google_java_format,
    formatting.shfmt,
    formatting.fixjson,

    -- linters
    diagnostics.flake8,
    diagnostics.write_good,
    diagnostics.tsc,
    diagnostics.shellcheck,
    diagnostics.codespell,
    diagnostics.sqlfluff.with {
      extra_args = { "--dialect", "postgres" }, -- change to your dialect
    },

    -- code actions
    code_actions.gitsigns,
    code_actions.gitrebase,

    -- hover
    hover.dictionary,
  },
}
