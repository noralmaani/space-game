
Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("assets/shipPink_manned.png")
    self.x = 300
    self.y = 20
    self.speed = 300
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.keytimer = 0
    count = 0
end

function Player:keypressed(key)
    if key == "space" and self.keytimer <= 0 then
        table.insert(listOfLasers, Laser(self.x, self.y))
        self.keytimer = 0.3
    end
end

function Player:update(dt)
    self.keytimer = self.keytimer - dt

    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    -- make sure player can't move outside the window 
    local window_width = love.graphics.getWidth()
    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end