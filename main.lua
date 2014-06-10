--
-- Created by IntelliJ IDEA.
-- User: thurstonjm
-- Date: 6/9/14
-- Time: 2:49 PM
-- To change this template use File | Settings | File Templates.
--

display.setStatusBar( display.HiddenStatusBar )

local myWidth = display.contentWidth
local myHeight= display.contentHeight

local myTextObject = display.newText( "Hello World!", myWidth/2, myHeight/2, "Arial", 60 )
myTextObject:setTextColor( 1, 1, 1 )

function drawRectangles()
    for i = 1, 100 do
        local newRectangle = display.newRect( math.random(myWidth),
            math.random(myHeight), 10 + math.random(200), 10 + math.random(200) )
        newRectangle:setFillColor( math.random(), math.random(), math.random() )
    end
end

drawRectangles()

function screenTap()
    local r = math.random( 0, 100 )
    local g = math.random( 0, 100 )
    local b = math.random( 0, 100 )
    myTextObject:setFillColor( r/100, g/100, b/100 )
end

local topLeft = display.newText("0:0", 25, 10, nil, 24)
local topRight = display.newText(myWidth.. ":0", myWidth-40, 10, nil, 24)
local bottomLeft = display.newText("0:" .. myHeight, 45, myHeight-10, nil, 24)
local bottomRight = display.newText(myWidth ..":".. myHeight, myWidth-60, myHeight-10, nil, 24)

local group = display.newGroup()
group:insert( topLeft )
group:insert( topRight )
group:insert( bottomLeft )
group:insert( bottomRight )

group.isVisible = true

myTextObject:toFront()

local function myTapListener( event )
    --code executed when the button is tapped
    if group.isVisible then
        group.isVisible = false
    else
        group.isVisible = true
    end
    return true
end

myTextObject:addEventListener( "tap", myTapListener )  --add a "tap" listener to the object