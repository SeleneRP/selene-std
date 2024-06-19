local Tasks = {}

function Tasks.wait(duration)
    return function(entity_id, data)
        local co = coroutine.running()
        local effectiveDuration = type(duration) == "function" and duration(entity_id) or duration
        create_timeout(effectiveDuration, function()
            coroutine.resume(co)
        end)
        return coroutine.yield()
    end
end

return Tasks