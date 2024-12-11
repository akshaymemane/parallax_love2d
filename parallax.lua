
local Parallax = {}

function Parallax:new(images, parallaxType)
    local obj = {
        layers = {},
        type = parallaxType or "horizontal" -- Default to horizontal if not specified
    }

    for _, imageInfo in ipairs(images) do
        local image = love.graphics.newImage(imageInfo.path)
        table.insert(obj.layers, {
            image = image,
            speed = imageInfo.speed,
            x = 0,
            y = 0,
            sequence = imageInfo.sequence
        })
    end

    -- Sort layers by sequence number
    table.sort(obj.layers, function(a, b) return a.sequence < b.sequence end)

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Parallax:update(dt, scrollSpeed)
    scrollSpeed = scrollSpeed or 1

    for _, layer in ipairs(self.layers) do
        if self.type == "horizontal" then
            layer.x = layer.x - (layer.speed * scrollSpeed * dt)
            if layer.x + layer.image:getWidth() <= 0 then
                layer.x = layer.x + layer.image:getWidth()
            end
        elseif self.type == "vertical" then
            layer.y = layer.y - (layer.speed * scrollSpeed * dt)
            if layer.y + layer.image:getHeight() <= 0 then
                layer.y = layer.y + layer.image:getHeight()
            end
        end
    end
end

function Parallax:render()
    for _, layer in ipairs(self.layers) do
        if self.type == "horizontal" then
            love.graphics.draw(layer.image, layer.x, 0)
            love.graphics.draw(layer.image, layer.x + layer.image:getWidth(), 0)
        elseif self.type == "vertical" then
            love.graphics.draw(layer.image, 0, layer.y)
            love.graphics.draw(layer.image, 0, layer.y + layer.image:getHeight())
        end
    end
end

function Parallax:renderParallax()
    self:render()
end

return Parallax