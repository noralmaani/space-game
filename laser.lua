Laser = Object:extend()

function Laser:new(x, y)
    self.image = love.graphics.newImage("assets/laserPink.png")
    self.x = x
    self.y = y
    self.speed = 1000
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Laser:update(dt)
    self.y = self.y + self.speed * dt
end

function Laser:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Laser:checkCollision(obj)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = obj.x
    local obj_right = obj.x + obj.width
    local obj_top = obj.y
    local obj_bottom = obj.y + obj.height


    if  self_right > obj_left
    and self_left < obj_right
    and self_bottom > obj_top
    and self_top < obj_bottom then
        self.dead = true

        -- increase speed every time enemy is hit
        if obj.speed > 0 then
            obj.speed = obj.speed + 100
        else
            obj.speed = obj.speed - 100
        end
    end
end