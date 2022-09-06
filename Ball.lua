Ball = Class{}

STARTING_DY = -200

function Ball:init()
    self.width = 4
    self.height = 4
    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGHT - 46

    self.dx = math.random(-100, 100)
    self.dy = STARTING_DY
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    if self.y < 6 then
        self.dy = -self.dy
        self.dx = self.dx + math.random(-20, 20)
    elseif self.x < 6 or self.x > VIRTUAL_WIDTH - 6 then
        self.dx = -self.dx
    end
end

function Ball:collides(object)
    if self.y > object.y + object.height or object.y > self.y + self.height then
        return false
    end

    if self.x > object.x + object.width or object.x > self.x + self.width then
        return false
    end

    return true
end

function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGHT - 46

    self.dx = math.random(-100, 100)
    self.dy = STARTING_DY
end

function Ball:render()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end