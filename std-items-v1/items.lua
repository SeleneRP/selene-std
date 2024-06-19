local Item = require("std-items-v1/item")

local Items = {}

function Items.create_item()
    return Item.new(name, count)
end

return Items