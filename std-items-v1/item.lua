local Item = {}
Item.__index = Item

function Item.new(name, count)
    local self = setmetatable({}, Item)
    self.name = name
    self.count = count
    return self
end

return Item