Paddle = Class{}

local PADDLE_WIDTH = 40
local PADDLE_HEIGHT = 5
PADDLE_SPEED = 2

function Paddle:init()
    self.x = VIRTUAL_WIDTH / 2 - 20
    self.y = VIRTUAL_HEIGHT - 40

    self.width = PADDLE_WIDTH
    self.height = PADDLE_HEIGHT

    self.dx = 0
end

function Paddle:update(dt)
    self.x = self.x + self.dx * PADDLE_SPEED
    if self.x < 5 then
        self.x = 7
        self.dx = 0
    elseif self.x + PADDLE_WIDTH > VIRTUAL_WIDTH - 5 then
        self.x = VIRTUAL_WIDTH - 7 - PADDLE_WIDTH
        self.dx = 0
    end
end

function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, PADDLE_WIDTH, PADDLE_HEIGHT)
end
