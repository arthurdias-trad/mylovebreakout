BrickWall = Class{}

function BrickWall:init()
    self.bricks = {}
    self.x = 15
    self.y = 30

    for i = 1, 8 do
        if i > 1 then
            self.y = self.y + 10
        end
        for j = 1, 8 do
            brick = Brick(self.x, self.y)
            table.insert(self.bricks, brick)
            if j == 8 then
                self.x = 15
            else
                self.x = self.x + brick.width + 7
            end
        end
    end
end

function BrickWall:render()
    for k, brick in pairs(self.bricks) do
        brick:render()
    end
end
