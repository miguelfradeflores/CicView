----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

-- local storyboard = require( "storyboard" )
-- local scene = storyboard.newScene()
local composer = require( "composer" )
local scene = composer.newScene()


local oso,oso2 

local fondo2,fondo,contraste
----------------------------------------------------------------------------------
-- 

---------------------------------------------------------------------------------
local _W = display.contentWidth
local _H = display.contentHeight
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:create( event )
	local group = self.view
		 contraste =display.newImageRect("portada.png",550,756)
		contraste.x=_W/2
		contraste.y=_H/2
	-----------------------------------------------------------------------------
	
		group:insert(contraste)
	
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is on screen and is about to move off screen

	function group:touch( e )
		if e.phase=="ended" or e.phase=="cancelled" then

			
		composer.gotoScene( "scenetemplate", "fade", 500 )
		end	
	end
		-- body
	--end
	-----------------------------------------------------------------------------
	group:addEventListener("touch",group)

	elseif phase == "did" then

	end

end


-- Called when scene is about to move offscreen:


-- Called prior to the removal of scene's "view" (display group)
function scene:hide( event )
	local group = self.view
	
		local phase = event.phase
	
	if event.phase == "will" then

	elseif phase == "did" then

		group:removeEventListener("touch",group)	
		-- Called when the scene is now off screen
	end	--------------------------------------------------------------------
	
end


--scene:destroyScene() will be called just prior to:
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
