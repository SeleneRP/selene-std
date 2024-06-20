local Inventory = require("std-items-v1/inventory")

local ItemPredicates = {}

function ItemPredicates.has_item_in_hand(item, error)
    return function(entity_id)
        return not Inventory.has_item(entity_id, item, 1, "#hand") and error or true
    end
end

function ItemPredicates.has_item(item, count, error)
    return function(entity_id)
        return not Inventory.has_item(entity_id, item, count) and error or true
    end
end

extend("std-routines-v1.predicates", function(Predicates)
    Predicates.has_item_in_hand = ItemPredicates.has_item_in_hand
    Predicates.has_item = ItemPredicates.has_item
end)

return ItemPredicates