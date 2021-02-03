--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety, shinyTile)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    self.toggle = false


    -- tile appearance/points
    self.color = color
    self.variety = variety

    self.shinyTile = shinyTile
    
    Timer.every(0.50, function()
        self.toggle = not self.toggle
    end)

end

-- update the particle system with delta time
function Tile:update(dt)
    self.p_system:update(dt)
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34/255, 32/255, 52/255, 1)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    if self.shinyTile == true and self.toggle then
        love.graphics.setColor(0, 0, 0, 0)
    else
        love.graphics.setColor(1, 1, 1, 1)
    end

    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
end