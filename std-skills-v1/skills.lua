local Skills = {}

function Skills.learn_skill(entity_id, skill_id, a, b)

end

function Skills.set_skill(entity_id, skill_id, level)
    local data = get_entity_data(entity_id)
    data.skills = data.skills or {}
    data.skills[skill_id] = level
end

function Skills.set_skill_xp(entity_id, skill_id, xp)
    local data = get_entity_data(entity_id)
    data.skills_xp = data.skills_xp or {}
    data.skills_xp[skill_id] = xp
end

function Skills.get_skill(entity_id, skill_id)
	local data = get_entity_data(entity_id)
    local value = data.skills and data.skills[skill_id] or 0
    return value and value or 0
end

function Skills.get_skill_xp(entity_id, skill_id)
    local data = get_entity_data(entity_id)
    local value = data.skills_xp and data.skills_xp[skill_id] or 0
    return value and value or 0
end

return Skills