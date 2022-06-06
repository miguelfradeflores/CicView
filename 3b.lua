----------------------------------------------------------------------------------
-- escena 3b.lua
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local oso,oso2 

local fondo2,fondo,contraste
local elec =  audio.loadSound("arc.mp3")
----------------------------------------------------------------------------------
-- 
---------------------------------------------------------------------------------
local _W = display.contentWidth
local _H = display.contentHeight
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:create( event )
	local group = self.view

	-----------------------------------------------------------------------------
	--	fondo= display.newImageRect("3c1.png",1024,768)
	local sheet5 = graphics.newImageSheet( "3cs1.png", { width=1024, height=683, numFrames=2 } )
	
	fondo = display.newSprite( sheet5, { frames={1,2,1,2,1,2,1,2}, time=1600, loopCount=3 } )
	fondo.x=_W/2
	fondo.y=_H/2
	fondo.yScale=1.2

	group:insert(fondo)	

	-----------------------------------------------------------------------------
	
end

-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view
	local phase = event.phase
	if phase=="will" then
	
	-----------------------------------------------------------------------------
		audio.play(elec)
	-----------------------------------------------------------------------------
		fondo:play()
	local count = 1
	function group:touch( e )
		if e.phase=="ended" or e.phase=="cancelled" then

			if count==1 then
	
			composer.gotoScene( "scenetemplate" )
			end	
		end
		-- body
	end
	-----------------------------------------------------------------------------
		group:addEventListener("touch",group)
	elseif phase=="did" then

	end	

end

function scene:hide( event )
	local group = self.view
	local phase = event.phase

	if phase =="will" then

		audio.pause(elec)
		audio.rewind(elec)

	elseif phase == "did" then	
	-----------------------------------------------------------------------------
	-----------------------------------------------------------------------------
		group:removeEventListener("touch",group)

	end
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	local group = self.view
		
end


-----------------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene