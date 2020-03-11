-----------------------------------------------------------------------------------------
--Name: Adrijan
-- main.lua
--ICS20
--asks the user an addition question. 
--When the user enters their answer in a numeric text 
--field if they answer the question correctly "correct"
-- is displayed otherwise incorrect is displayed.
-----------------------------------------------------------------------------------------

--Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background color
display.seDefault("background", 124/255, 249/255, 199/255)

-------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------

--create local variables
local questionObject
local correctObject
local numericField 
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------

local function askQuestion()
	--gernerate 2 random numbers between a max. and a min.
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	--create question in text object 
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="
end

local function HideCorrect()
	correctObject.isvisible = false
	askQuestion()
end

local function numericFieldListener(event)

	--user begins editing "numericField"
	if ( event.phase == "began" ) then

		--clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		--when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		--if the user answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
		end
	end
end

-------------------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------------

--display a question and sets the color
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(155/255, 42/255, 198/255)

--create the correct text object and make it invisible
correctObject = display.newText("Correct!". display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isvisible = false

--create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

--add the event listener for the numeric field
numericField:addEventListener( "userInput", numericFieldListener )