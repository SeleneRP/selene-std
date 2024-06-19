local Attributes = {}

function Attributes.get_attribute(entity_id, attribute_id)
	local base_value = Attributes.get_base_attribute(entity_id, attribute_id)
	-- TODO apply modifiers
	return base_value
end

function Attributes.get_base_attribute(entity_id, attribute_id)
	local data = get_entity_data(entity_id)
	local value = data.attributes and data.attributes[attribute_id] or 0
	return value and value or 0
end

function Attributes.set_base_attribute(entity_id, attribute_id, value)
	local data = get_entity_data(entity_id)
	data.attributes = data.attributes or {}
	data.attributes[attribute_id] = value
end

return Attributes