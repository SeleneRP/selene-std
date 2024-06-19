local Routine = require("std-routines-v1/routine")

local Routines = {}

Routines.FAILURE = 0
Routines.SUCCESS = 1

Routines.routines = {}

function Routines.register_routine(id)
    local routine = Routine:new(name)
    Routines.routines[name] = routine
    return routine
end

function Routines.start_routine(entity_id, routine_id, data)
    local routine = Routines.routines[routine_id]
    if routine then
        return routine:start(entity_id, data)
    return create_error("routine_not_found")
end

return Routines