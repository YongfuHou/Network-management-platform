core = {}

local h = require "luci.http"
local n = require "nixio"

function core.get(name)
    if name == "" then
        return ""
    else
        return string.gsub(h.formvalue(name) or "", '[&<>"]+', "")
    end
end

return core
