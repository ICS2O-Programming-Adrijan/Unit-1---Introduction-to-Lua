-- Title: MovingObjects
-- Name: Adrijan.V
-- Course: ICS2O/3C
-- This program moves 
--a beetleship across the screen and
-- then makes it fade out.
-- I added a second object that
-- moves in a different direction
--fades out and grows in size.
---------------------------------------------------------------------------------
-- hide the status background
display.setStatusBar(display.HiddenStatusBar)

local music = audio.loadSound("Sounds/bkgMusic.mp3")
local musicChannel

local function Music()
	musicChannel = audio.play(music)
end

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png",2048, 1536)

--character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

--set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
--Input: this function accepts an event listener
--Output: none 
--Description This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparentcy of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--character image with width and height
local star = display.newImageRect("Images/star.png", 200, 200)

--set the image to be visible
star.alpha = 1

--set the initial x and y position of the star
star.x = 1024
star.y = display.contentHeight/8

newScrollSpeed = -3
--Change the scroll speed
--Function: MoveShip
--Input: This function accepts an event listener
--Output: none
--Description: this function adds the scroll speed to the x-value of the ship
local function moveStar(event)
	--add the scroll speed to the x-valueof the ship
	star.x = star.x + newScrollSpeed
	--change the transparentcy of the ship every time it moves
	star.alpha = star.alpha - 0.01
end

--movestar will be called over and over again
Runtime:addEventListener("enterFrame", moveStar) 

Runtime:addEventListener("enterFrame", Music)