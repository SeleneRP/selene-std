local Predicates = {}

function Predicates.tile_still_valid(tile_id)
    return function(entity_id, data)
        return get_tile(data.tile_position) == tile_id
    end
end

return Predicates