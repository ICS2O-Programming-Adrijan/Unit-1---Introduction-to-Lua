-----------------------------------------------------------------------------------------
-- Adrijan
-- main.lua
--ICS2O
--
-----------------------------------------------------------------------------------------

--Hide the status bar
display.setStatusBar(display.hiddenStatusBar)

--load physics
physics = require("physics")

--start physics
physics.start()
-----------------------------------------------------------
--OBJECTS
-----------------------------------------------------------

--Ground
local ground = display.newImage("Images/ground.png", 0, 0)
ground.x = 512
ground.y = 768

--change the width to be the same as the screen
ground.width = display.contentWidth

-- add to physics 
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-------------------------------------------------------------

local beam = display.newImage("Images/beam_long.png", display.contentWidth/2, display.contentHeight/10)

--set the x and y position
beam.x = 80
beam.y = display.contentCenterY*1.65

--rotate the beam -60 degrees so its on an angle
beam:rotate(45)

--send it to the back layer
beam:toBack()

--add to physics
physics.addBody(beam, "static", {friction=0.5, bounce=0.3})
------------------------------------------------------------
local beam2 = display.newImage("Images/beam_long.png", 900, 680)

--rotate the beam 
beam2:rotate(-25)


--set the x and y position
beam.x = 80
beam.y = display.contentCenterY*1.65

--send to back 
beam2:toBack()

--add to physics
physics.addBody(beam2, "static", {friction=1, bounce=1})



----------------------------------------------------------------
--create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)

--set the x and y pos
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

bkg.width = 1024
bkg.height = 768


--send to back
bkg:toBack()
------------------------------------------------------------

---------------------------------------------------------------
--FUNCTIONS
-------------------------------------------------------------------
-- create the first ball
local function FirstBall()
	-- creating FirstBall
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end
-----------------------------------------------------------------
local function SecondBall()
	local ball2 = display.newImage("Images/super_ball.png", 1000, 0)

	--add to physics
	physics.addBody(ball2, {density=3, friction=0.5, bounce=0.3, radius=20})	
end

---------------------------------------------------------------------
--TIMER DELAYS - call each function after the given millisecond
----------------------------------------------------------------------
timer.performWithDelay(0, firstBall)

timer.performWithDelay(500, SecondBall)

