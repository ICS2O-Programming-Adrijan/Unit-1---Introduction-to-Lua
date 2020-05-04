-----------------------------------------------------------------------------------------
--Adrijan
-- main.lua
--ICS20
--create an app that makes an object appear on the screen
--for an amount of time and then disappears
--if the user clicks on the object, his or her score
-- increases by 1
-----------------------------------------------------------------------------------------
--remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Cresting a background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight)
	
	bkg:setFillColor( 217/255, 100/255, 90/255)

	--setting position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

--creating Mole
local mole = display.newImage( "Images/mole.png", 0, 0 )
	
	--setting position 
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	mole:scale(0.3, 0.3)

	mole.isVisible = false

--adding the score
local score = 0

local scoreText = display.newText("Score = "..score.."", 100, 100)
scoreText.x = 140
scoreText.y = 50

scoreText:setFillColor(127/255, 200/255, 73/255)

scoreText:scale(3, 3)

--------------------FUNCTIONS---------------------------

--this function that makes the mole appear in a random
-- position on the screen before calling the hide function
function PopUp( )
	
	--choosing a random positionon the screen between 0
	--and the size of the screen
	mole.x = math.random( 0, display.contentWidth)
	mole.y = math.random( 0, display.contentHeight)

	mole.isVisible = true

	timer.performWithDelay(500, Hide)
end

--this function calls the PopUp function after 3 sec.
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end

--this function makes the mole invisible and then calls the PopUpDelay function 	function Hide()
local function Hide()

	--changing the visibility
	mole.isVisible = false

	Runtime:addEventListener("enterFrame", PopupDelay)
end

-- this function starts the game
function GameStart()
	PopUpDelay()
end

--this function adds to the score when the user clicks the mole
function Whached( event )

	--if touch phase just started
	if (event.phase == "began") then
		score = 1
		scoreText.text = "Score = "..score..""
	end
end

----------------------EVENT LISTENERS------------------------
-- I add the event listener to the moles so that if the
-- mole is touched, the Whached function 
--is called

mole:addEventListener( "touch", Whached)

GameStart()





