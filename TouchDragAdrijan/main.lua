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

--set initial x and y position of myImage
blueGirl.x = 400
blueGirl.y = 500

yellowGirl.x = 300
yellowGirl.y = 200

--Function: BlueGirlListener
--Input: touch listener
--output: none
--Desription: when Blue girl is touched, move her
local function BlueGirlListener(touch)

   if (touch.phase == "began") then	
        if (alreadyTouchedYellowGirl == false) then
    	  alreadyTouchedBlueGirl = true
       end
   end
    if ( (touch.phase == "moved")) and (alreadyTouchedBlueGirl == true) then
	  blueGirl.x = touch.x
	  blueGirl.y = touch.y
    end

    if (touch.phase == "ended") then
	 alreadyTouchedBlueGirl = false
 	 alreadyTouchedYellowGirl = false
    end
end

--add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

--Function: YellowGirlListener
--Input: touch listener
--output: none
--Description: when yellow girl is touched, move her
local function YellowGirlListener(touch)
      
       if (touch.phase == "began") then
      	    if (alreadyTouchedBlueGirl == false) then
              alreadyTouchedYellowGirl = true
            end
      end
	
	  if ( (touch.phase == "moved")) and (alreadyTouchedYellowGirl == true) then
	  	  yellowGirl.x = touch.x
	  	  yellowGirl.y = touch.y
	  end

	  if (touch.phase == "ended") then
	      alreadyTouchedYellowGirl = false
	      alreadyTouchedBlueGirl = false
       end
end

-- add the respective listeners to each object
yellowGirl:addEventListener("touch", YellowGirlListener)