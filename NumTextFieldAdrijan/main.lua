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
display.setDefault("background", 124/255, 249/255, 199/255)

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
local incorrectObject


------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------

local function askQuestion()

	--gernerate 2 random numbers between a max. and a min.
	randomNumber1 = math.random(0, 8)
	randomNumber2 = math.random(0, 8)

	correctAnswer = randomNumber1 + randomNumber2

	--create question in text object 
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="
end

local function HideCorrect()
	correctObject.isvisible = false
	incorrectObject.isVisible = false
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
			incorrectObject.isVisible = false
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
			event.target.text = ""

		else 
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			event.target.text = ""

		end
	end
end



-------------------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------------

--display a question and sets the color
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, arial, 100 )
questionObject:setTextColor(155/255, 42/255, 198/255)

--create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isvisible = false
incorrectObject = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )

--create numeric field
numericField = native.newTextField( 700, display.contentHeight/2, 200, 120 )
numericField.inputType = "number"

--add the event listener for the numeric field
numericField:addEventListener( "userInput", numericFieldListener )

--------------------------------------------------------\-------------------
--FUNCTION CALL
-----------------------------------------------------------------------------

--call the function to ask the question
askQuestion()


