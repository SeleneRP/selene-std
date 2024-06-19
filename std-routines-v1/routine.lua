local Routine = {}
Routine.__index = Routine

function Routine:new(name)
    local self = setmetatable({}, Routine)
    self.name = name
    self.tasks = {}
    self.abort_func = nil
    self.failure_func = nil
    return self
end

function Routine:then(task)
    table.insert(self.tasks, task)
    return self
end

function Routine:on_abort(func)
    self.abort_func = func
    return self
end

function Routine:on_failure(func)
    self.failure_func = func
    return self
end

function Routine:run_in(co, entity_id, data)
    for _, task in ipairs(self.tasks) do
        local success, result = coroutine.resume(co, task, entity_id, data)
        if not success or result ~= Routines.SUCCESS then
            if self.failure_func then
                self.failure_func(entity_id, data, result)
            end
            return result
        end
    end

    return Routines.SUCCESS
end

function Routine:start(entity_id, data)
    local co = coroutine.create(function()
        self:run_in(co, entity_id, data)
    end)
    return coroutine.resume(co)
end