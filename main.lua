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

if myWidth <= 320
    then bigFontSize=50
    smallFontSize = 20
end

if (myWidth <= 640 and myWidth >320)
    then bigFontSize=75
    smallFontSize = 40
end

if (myWidth <= 800 and myWidth >640)
    then bigFontSize=125
    smallFontSize = 40
end

if (myWidth <= 1536 and myWidth >800)
    then bigFontSize=175
    smallFontSize = 40
end


local myTextObject = display.newText( "Grid Helper", myWidth/2, myHeight/2 - 150, "Arial", bigFontSize)
myTextObject:setTextColor( 1, 1, 1 )

function drawRectangles()
    for i = 1, 100 do
        local newRectangle = display.newRect( math.random(myWidth),
            math.random(myHeight), 10 + math.random(200), 10 + math.random(200) )
        newRectangle:setFillColor( math.random(), math.random(), math.random() )
    end
end

function drawBackground()
    local newRectangle1 = display.newRect(1, 1, myWidth, myHeight)
    newRectangle1:setFillColor(.5,0,0)

    local newRectangle2 = display.newRect(1, myHeight, myWidth, myHeight)
    newRectangle2:setFillColor(0,.5,0)

    local newRectangle3 = display.newRect(myWidth, 1, myWidth, myHeight)
    newRectangle3:setFillColor(0,.5,1)

    local newRectangle4 = display.newRect(myWidth, myHeight, myWidth, myHeight)
    newRectangle4:setFillColor(.5,0,.5)

end

--drawRectangles()
drawBackground()

function screenTap()
    local r = math.random( 0, 100 )
    local g = math.random( 0, 100 )
    local b = math.random( 0, 100 )
    myTextObject:setFillColor( r/100, g/100, b/100 )
end

local topLeft = display.newText("0:0", 40, 20, nil, smallFontSize)
local topRight = display.newText(myWidth.. ":0", myWidth-60, 20, nil, smallFontSize)
local bottomLeft = display.newText("0:" .. myHeight, 75, myHeight-20, nil, smallFontSize)
local bottomRight = display.newText(myWidth ..":".. myHeight, myWidth-100, myHeight-20, nil, smallFontSize)
local middleCenter = display.newText(myWidth/2 ..":".. myHeight/2, myWidth/2, myHeight/2, nil, smallFontSize)

local group = display.newGroup()
group:insert( topLeft )
group:insert( topRight )
group:insert( bottomLeft )
group:insert( bottomRight )
group:insert( middleCenter )

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