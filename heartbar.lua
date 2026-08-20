Heart = Object:extend()

function Heart:new(x, y)
    self.image_barfull = love.graphics.newImage("assets/heart.png")
    self.image_bartwo = love.graphics.newImage("assets/heart_two.png")
    self.image_barone = love.graphics.newImage("assets/heart_one.png")
    self.image_barzero = love.graphics.newImage("assets/heart_zero.png")
    self.x = 1
    self.y = 1
end


function updateHeartBar()
    hearbarFull = (count_heart <= 0)
    heartbarTwo = (count_heart == 1)
    heartbarOne = (count_heart == 2)
    heartbarZero = (count_heart >= 3)
end

function Heart:draw()
    if hearbarFull then
        love.graphics.draw(self.image_barfull, self.x, self.y)
    elseif heartbarTwo then
        love.graphics.draw(self.image_bartwo, self.x, self.y)
    elseif  heartbarOne then
        love.graphics.draw(self.image_barone, self.x, self.y)
    elseif heartbarZero then
    love.graphics.draw(self.image_barzero, self.x, self.y)

    end
end

