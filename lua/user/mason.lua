local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",  -- Simple to use language server installer
  }
}


function M.config()

  local servers = {
    "lua_ls",
    "html",
    "bashls",
    "pyright",
    "texlab",
    "clangd",
    "rust_analyzer",
    "gopls",
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    }
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M

-- local settings = {
--   ui = {
--     border = "none",
--     icons = {
-- 			package_installed = "◍",
-- 			package_pending = "◍",
-- 			package_uninstalled = "◍",
--     },
--   },
--   log_level = vim.log.levels.INFO,
--   max_concurrent_installers = 4,
-- }
--
-- require("mason").setup(settings)
-- require("mason-lspconfig").setup({
--   ensure_installed = servers,
--   automatic_installation = true,
-- })
--
-- local status_ok, lspconfig = pcall(require, "lspconfig")
-- if not status_ok then
--   return
-- end
--
-- local opts = {}
--
-- for _, server in pairs(servers) do
--   opts = {
--     on_attach = require("user.lsp.handlers").on_attach,
--     capabilities = require("user.lsp.handlers").capabilities,
--   }
--
--   server = vim.split(server, "@")[1]
--
--   local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
--   if require_ok then
--     opts = vim.tbl_deep_extend("force", conf_opts, opts)
--   end
--
--   lspconfig[server].setup(opts)
-- end
