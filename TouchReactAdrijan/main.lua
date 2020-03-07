-----------------------------------------------------------------------------------------
-- Title: Buttons in Lua 
-- Name: Adrijan
-- Course: ICS20
-- This porgram does something when i click on the button 
-----------------------------------------------------------------------------------------

--set background colour
display.setDefault ("background", 153/255, 204/255, 255/255)

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

--create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198,96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

--Function: BlueListener
--Input: touch listener
--output: none
--Description: when blue button is clicked, it will make the text appear with the red button
--and make the blue button disappear
local function BlueButtonListener(touch)
	-- body
end