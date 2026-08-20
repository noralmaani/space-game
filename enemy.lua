Enemy = Object:extend()
Enemy2 = Object:extend()
Enemy3 = Object:extend()

function Enemy:new()
    self.image = love.graphics.newImage("assets/shipBlue_manned.png")
    self.x = 300
    self.y = 450
    self.speed = 500
    self.obstacletimer = 1
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Enemy:update(dt)
    self.x = self.x - self.speed * dt
    local window_width = love.graphics.getWidth()
    if self.x < 0 then
        self.x = 0 
        -- bounce to left when hitting right wall
        self.speed = -self.speed
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        -- bounce to right when hitting left wall
        self.speed = -self.speed
    end

    self.obstacletimer = self.obstacletimer + dt
    if not defeated then
        if self.obstacletimer > 1 then
            table.insert(listOfObstacles, Obstacle(self.x, self.y))
            self.obstacletimer = 0
        end
    end
end

function Enemy:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Enemy2:new()
    self.image = love.graphics.newImage("assets/shipGreen_manned.png")
    self.x = 300
    self. y = 450
    self.speed = 1200
    self.obstacletimer = 0
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Enemy2:update(dt)
    self.x = self.x - self.speed * dt
    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
        self.speed = -self.speed

    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self.speed = -self.speed
    end


    self.obstacletimer = self.obstacletimer + dt

    if not final then
        if self.obstacletimer > 1 then
            table.insert(listOfObstacles, Obstacle_green(self.x, self.y))
            self.obstacletimer = 0
        end
    end
end

function Enemy2:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Enemy3:new()
    self.image = love.graphics.newImage("assets/shipYellow_manned.png")
    self.x = 300
    self. y = 450
    self.speed = 1300
    self.obstacletimer = 0
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Enemy3:update(dt)
    self.x = self.x - self.speed * dt
    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
        self.speed = -self.speed

    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self.speed = -self.speed
    end


    self.obstacletimer = self.obstacletimer + dt

    if self.obstacletimer > 0.5 then
        if final then
            table.insert(listOfObstacles, Obstacle_yellow(self.x, self.y))
            self.obstacletimer = 0
        end
    end
end

function Enemy3:draw()
    love.graphics.draw(self.image, self.x, self.y)
end
