-----------------------------------------------------------------------------------------
--Name: Adrijan
-- main.lua
--Class: ICS20
--In this math game the user will have 
--to answer either a addition, multiplication or division
-----------------------------------------------------------------------------------------
--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 30/255, 200/255, 150/255)

----------------------------------------------------------------------------------
--LOCAL VARIABLES
-------------------------------------------------------------------------


--setting the variables 
local equationOption
local randomNumber1
local randomNumber2
local userAnswer
local numericField
local questionObject
local correctAnswer
local correctObject
local incorrectObject
local randomOperator
local points
local pointsText
local liveNumber
local heart1
local heart2
local heart3
local gameOverObject
local winnerObject
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

-------------------------------------------------------------------
--SOUNDS
----------------------------------------------------------------------
--Correct sound 
local correctSound = audio.loadSound("Sounds/incorrectSound.mp3")
local correctSoundChannel

--Incorrect sound 
local incorrectSound = audio.loadSound("Sounds/wrongSound.mp3")
local incorrectSoundChannel 

----------------------------------------------------------------------
--LOCAL FUNCTIONS
---------------------------------------------------------------------------

local function askQuestion()
	

	--generate a number between 1 and 4
	randomOperator = math.random(1,4)

	--gernerate 2 random numbers between a max. and a min.
	randomNumber1 = math.random(0, 4)
	randomNumber2 = math.random(0, 4)

	--if the randomOperator is 1 do addition
	if (randomOperator == 1) then

		--calculate the answer
		correctAnswer = randomNumber1 + randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	--otherwise, if the randomOperator chooses 2 then do subtraction
	elseif (randomOperator == 2) then
		if (randomNumber1 > randomNumber2) then
			--calculate the correct answer
			correctAnswer = randomNumber1 - randomNumber2

			--create the question in the text box
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
		else 
			askQuestion()
		end
	elseif ( randomOperator == 3) then 

		--calculate the correctAnswer
		correctAnswer = randomNumber1 * randomNumber2

		--create the question 
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
	elseif ( randomOperator == 4) then 
		randomNumber1 = math.random(1,4)
		randomNumber2 = math.random(1,4)

		--calculate the correctAnswer
		correctAnswer = randomNumber1 / randomNumber2
		correctAnswer = correctAnswer * 10
		correctAnswer = math.round(correctAnswer)
		correctAnswer = correctAnswer / 10 

		-- create the question
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "
	end
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
			correctSoundChannel = audio.play(correctSound)
			--give the user a point if they get the correct answer
			points = points + 1
			incorrectObject.isVisible = false
			correctObject.isVisible = true
			timer.performWithDelay(100, HideCorrect)
			event.target.text = ""
		else 
			incorrectSoundChannel = audio.play(incorrectSound)
			-- taking away the hearts
			liveNumber = liveNumber - 1
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			event.target.text = ""
			askQuestion()
		end
	end
end




local function heartNumber(event)
	

	if (liveNumber == 2) then
		heart1.isVisible = false
	elseif (liveNumber == 1) then
		heart1.isVisible = false
		heart2.isVisible = false
	elseif (liveNumber == 0) then
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		gameOverObject.isVisible = true	
		questionObject.isVisible = false
		numericField.isVisible = false
		pointsText.isVisible = false
		correctObject.isVisible = false
		incorrectObject.isVisible = false
	end
end

local function pointsCounter(event)
	if (points == 1) then
		pointsText.text = "points = 1"
	elseif (points == 2) then
		pointsText.text = "points = 2"
	elseif (points == 3) then
		pointsText.text = "points = 3"
	elseif (points == 4) then
		pointsText.text = "points = 4"
	elseif (points == 5) then
		pointsText.text = "points = 5"
		winnerObject.isVisible = true
		incorrectObject.isVisible = false
		pointsText.isVisible = false
		questionObject.isVisible = false
		numericField.isVisible = false
		correctObject.isVisible = false
		heart3.isVisible = false
		heart1.isVisible = false
		heart2.isVisible = false
	end
end

local function UpdateTime()
	
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds in the clock object 
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		--reset the number of seconds left 
		secondsLeft = totalSeconds
		liveNumber = liveNumber - 1
	end
end

--function that calls the timer
local function StartTimer()
	--create a countDownTimer that loops infinetely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end














-------------------------------------------------------------------------
--OBJECT CREATION
-------------------------------------------------------------------------

----display a question and sets the color
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, arial, 100 )
questionObject:setTextColor(155/255, 42/255, 198/255)

--create the correct text object and make it invisible
correctObject = display.newText( "Correct!", 400, 600, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isvisible = false
incorrectObject = display.newText("Incorrect!", 700, 600, nil, 50 )
incorrectObject.isvisible = false
--create numeric field
numericField = native.newTextField( 700, display.contentHeight/2, 200, 120 )
numericField.inputType = "decimal"

points = 0

-- display the amount of points as a text object
pointsText = display.newText("points = " .. points, 850, 100, nil, 50)
pointsText:setTextColor(155/255, 42/255, 198/255)

-- creating heart1
heart1 = display.newImageRect("Images/heart.png", 200, 150)
heart1.x = 100
heart1.y = 100

-- creating heart2
heart2 = display.newImageRect("Images/heart.png", 200, 150)
heart2.x = 300
heart2.y = 100

-- creating heart3
heart3 = display.newImageRect("Images/heart.png", 200, 150)
heart3.x = 500
heart3.y = 100

-- creating the number of lives
liveNumber = 3

gameOverObject = display.newImageRect("Images/gameOver.png", 700, 700, nil, 50)
gameOverObject.isVisible = false
gameOverObject.x = display.contentHeight/2
gameOverObject.y = display.contentWidth/2

winnerObject = display.newImageRect("Images/winner.png", 500, 500)
winnerObject.isVisible = false
winnerObject.x = display.contentHeight/2
winnerObject.y = display.contentWidth/2

clockText = display.newText("Time: " .. secondsLeft, 700, 500, nil, 70)
clockText.x = 700
clockText.y = 300





-----------------------------------------------------------------------
--FUNCTION CALL
------------------------------------------------------------------------

--call the function to ask the question
askQuestion()

StartTimer()

UpdateTime()




--add the event listener for the numeric field
numericField:addEventListener( "userInput", numericFieldListener )



-- added event heartNumber
Runtime:addEventListener("enterFrame", heartNumber)

--added event pointsCounter
Runtime:addEventListener("enterFrame", pointsCounter)




