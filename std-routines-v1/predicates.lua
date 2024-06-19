local Predicates = {}

function Predicates.sources_still_valid()
    return function(entity_id, data)
        for _, source in ipairs(data.sources) do
            if source.type === "tile" then
                if get_tile(source.position) == source.tile_id then
                    return true
                end
            end
        end
    end
end

function Predicates.create_tile_source(tile_id, tile_position)
    return {
        type = "tile",
        tile_id = tile_id,
        position = tile_position
    }
end

return Predicates