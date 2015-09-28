-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--physiscs engin enabled
local physics = require('physics')
physics.start()

--TItle
local title = display.newText("The wonderful World of Mr.block",display.contentWidth/2,-20,native.systemFont, 40)
--Mr.Block
local mr = display.newRect(display.contentWidth/2,display.contentHeight/2,100,100)
mr:setFillColor(255,0,15)
physics.addBody(mr,"dynamic",{bounce=.03})

--right button
local right = display.newRect(700,16,50,50)
right:setFillColor(0,0,255)
--left transition
local left = display.newRect(30,16,50,50)
left:setFillColor(255,255,0)
--moves block left
function leftmv(event)
	
	if event.phase == "began" then
		transition.to(mr,{delay=1, time=3000, x= 50 - 3 })
	end
end
left:addEventListener("touch", leftmv)

--function to  move right
function rightmv(event1)
	
	if event1.phase == "began" then
		transition.to(mr,{ time=3000, x= 50 + 700})
	end
end
right:addEventListener("touch", rightmv)
--ground
local ground = display.newRect(760,1024,2000,100)
physics.addBody(ground, "static",{bounce=.03})

--enemies
		local nocks = display.newRect(display.contentWidth/2, 0, 50, 50)
		nocks:setFillColor(math.random(),math.random(),math.random())
		physics.addBody(nocks)
		nocks:toFront()

		--enemy2
		local nocks2 = display.newRect(display.contentWidth/2, 0, 50, 50)
		nocks2:setFillColor(math.random(),math.random(),math.random())
		physics.addBody(nocks2)
		nocks2:toFront()
		--enemy3
		local nocks3 = display.newRect(display.contentWidth/2, 0, 50, 50)
		nocks3:setFillColor(math.random(),math.random(),math.random())
		physics.addBody(nocks3)
		nocks3:toFront()
	for i = 1, 30, 100 do
		transition.to(nocks,{delay=3, time=3000,x=math.random(-10,100), y=math.random(0,3000), iterations=100})
		transition.to(nocks2,{delay=3, time=3000,x=math.random(-10,200), y=math.random(0,3000), iterations=100})
		transition.to(nocks3,{delay=3, time=3000,x=math.random(-10,300), y=math.random(0,3000), iterations=100})

	end
--game over son!
	if mr.y == nocks.y or mr.x == nocks.y then
		display.newText("HA HA YOU LOSE!!!",display.contentWidth/2,display.contentHeight/2,native.systemFont, 30)
	end
