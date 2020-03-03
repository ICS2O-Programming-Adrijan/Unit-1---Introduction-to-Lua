-----------------------------------------------------------------------------------------
--Title: TouchAndDrag
--Name: Adrijan
--Course: ICS20
-----------------------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Local Variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local blueGirl = display.newImageRect("Images/girl5.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height 

local yellowGirl = display.newImageRect("Images/girl3.png", 150, 150)
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false