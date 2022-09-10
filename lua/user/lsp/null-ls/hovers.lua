local M = {}

local null_ls_utils = require "user.lsp.null-ls.utils"

local method = require("null-ls").methods.HOVER

function M.list_registered(filetype)
  local registered_providers = null_ls_utils.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

return M
