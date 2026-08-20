function love.load()
    local msg = "no arguments"
    text = love.graphics.newText(love.graphics.getFont(), msg)
    pos = {
        x = 50,
        y = 50,
    }

    messageTable = {}
    messageTable[1] = "Game controls => \n move: right and left arrows \n shoot: space"
    messageTable[2] = "Press enter to start"
    messageTable[3] = "Ops..you died:( \n \n press enter to play again"
    messageTable[4] = "You won! \n \n press enter to play again"

    Object = require "classic"
    require "player"
    require "enemy"
    require "laser"
    require "obstacle"
    require "heartbar"

    
    player = Player()
    heart = Heart()

    Enemies = {}
    Enemies[1] = Enemy()
    Enemies[2] = Enemy2()
    Enemies[3] = Enemy3()

    


    listOfLasers = {}
    listOfObstacles = {}
    count = 0
    start = false
    defeated = false
    final = false
    endgame = false
    win = false
    count_heart = 0
end


function love.update(dt)
    -- todo rewrite
    if not start then
        return
    end

    player:update(dt)
    Enemies[1]:update(dt)
    updateHeartBar()

    if defeated then
        Enemies[2]:update(dt)
        Enemies[3]:update(dt)
    end


    for i,v in ipairs(listOfLasers) do
        v:update(dt)
        v:checkCollision(Enemies[1])
        
        v:checkCollision(Enemies[2])
        v:checkCollision(Enemies[3])
        

        if v.dead then
            table.remove(listOfLasers, i)
            count = count + 1
            if count > 6 then
                defeated = true
                final = false
            end

            if count > 20 then
                final = true
            end

            if count > 50 then
                win = true
            end
        end
    end

    for i,v in ipairs(listOfObstacles) do
        v:update(dt)
        v:checkHit(player)
      
        if v.dead then
            table.remove(listOfObstacles, i)
            count_heart = count_heart + 1
            updateHeartBar()
            if count_heart >= 3 then
                endgame = true
            end
        end
    end
end

function love.keypressed(key)
    if key == "return" then
        if endgame or win then
            love.load()
            return
        end

        start = true
        return
    end


    if start and not endgame and not win then
        player:keypressed(key)
    end
end

function love.draw()
    -- todo rewrite
    if not start then
        love.graphics.print(messageTable[1], 100, 100)
        love.graphics.print(messageTable[2], 100, 200)
        return
    end

    if endgame then
        love.graphics.print(messageTable[3], 100, 100)
    end

    if win then
        love.graphics.print(messageTable[4], 100, 100)
    end


    if start and not endgame and not win then

        player:draw()
        heart:draw()
        if not defeated then
            Enemies[1]:draw()
        end


        if defeated and not final then
            Enemies[2]:draw()
        end

        if final and defeated then
            Enemies[3]:draw()
        end

        for i,v in ipairs(listOfLasers) do
            v:draw()
        end

        for i,v in ipairs(listOfObstacles) do
            v:draw()
        end

        love.graphics.print("score:"..count, 100)
    end



end
