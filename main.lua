push = require 'push'

Class = require "class"

-- class representing the Paddle 
require "Paddle"

-- class representing the Ball 
require "Ball"

-- class representing the Brick 
require "Brick"

-- class representing the Brick Wall 
require "BrickWall"

WINDOW_WIDTH = 480
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 240
VIRTUAL_HEIGHT = 360

function love.load()
    -- Set title
    love.window.setTitle("My Breakout")

    --Set filter
    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    -- Initialize player
    player = Paddle()

    -- Initialize ball
    ball = Ball()

    -- Initiliaze brick wall
    brickwall = BrickWall()

    --Initialize virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    gameState = 'start'
end

function love.update(dt)
    if gameState == 'play'then
        if love.keyboard.isDown('left') then
            player.dx = -PADDLE_SPEED
        elseif love.keyboard.isDown('right') then
            player.dx = PADDLE_SPEED
        else
            player.dx = 0
        end

        player:update(dt)
        ball:update(dt)

        if ball:collides(player) then
            ball.dy = -ball.dy
            ball.dx = ball.dx + math.random(-30, 30)
        end

        for k, brick in pairs(brickwall.bricks) do
            if ball:collides(brick) then
                ball.dy = -ball.dy
                ball.dx = ball.dx + math.random(-30, 30)
                table.remove(brickwall.bricks, k)
            end
        end

        if ball.y > VIRTUAL_HEIGHT - 5 then
            ball:reset()
            gameState = 'start'
        end
    end   
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    if key == 'enter' or key == 'return' then
        gameState = 'play'
    end
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.draw()
    push:start()

    love.graphics.clear(40/255, 25/255, 80/255, 1)

    player:render()
    ball:render()

    love.graphics.rectangle('line', 5, 5, VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 10)

    brickwall:render()

    push:finish()
end
