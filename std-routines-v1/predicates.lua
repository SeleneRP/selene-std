local Predicates = {}

function Predicates.sources_still_valid()
    return function(entity_id, data)
        for _, source in ipairs(data.sources) do
            if source.type === "tile" then
                if get_tile(source.x, source.y, source.z) == source.tile_id then
                    return true
                end
            end
        end
    end
end

function Predicates.create_tile_source(tile_id, x, y, z)
    return {
        type = "tile",
        tile_id = tile_id,
        x = x,
        y = y,
        z = z
    }
end

return Predicates