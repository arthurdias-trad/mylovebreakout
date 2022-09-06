Brick = Class{}

function Brick:init(x, y)
    self.x = x
    self.y = y

    self.width = 20.125
    self.height = 5
end

function Brick:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end