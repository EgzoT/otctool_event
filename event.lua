function Event()
    local event = {
        listeners = {};

        addListener = function(self, listener, name)
            local index = name or listener
            self.listeners[index] = listener
        end;

        removeListener = function(self, listener)
            self.listeners[listener] = nil
        end;

        on = function(self, listener, name)
            self:addListener(listener, name)
        end;

        off = function(self, listener)
            self:removeListener(listener)
        end;

        emit = function(self, ...)
            for a,b in pairs(self.listeners) do
                b(...)
            end
        end;

        removeAllListeners = function(self)
            self.listeners = {}
        end;

        listenerCount = function(self)
            local i = 0

            for a,b in pairs(self.listeners) do
                i = i + 1
            end

            return i
        end;

        clear = function(self)
            self:removeAllListeners()
        end;
    }

    return event
end
