local M = {}

function M.env_cleanup(venv)
  if string.find(venv, "/") then
    local temp = venv
    local final_venv = ""
    for w in venv:gmatch "([^/]+)" do
      final_venv = temp
      temp = w
    end
    venv = final_venv
  end
  return venv
end

return M
