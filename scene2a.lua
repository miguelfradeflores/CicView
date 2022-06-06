----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene =  composer.newScene()
local oso,oso2 

local fondo2,fondo,contraste
----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
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
		fondo= display.newImageRect("2a.png",1024,768)
		fondo.x=_W/2
		fondo.y=_H/2
		group:insert(fondo)	

	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view
	local phase = event.phase	
	-----------------------------------------------------------------------------
	if phase == "will" then	
	local count = 1
	function group:touch( e )
		if e.phase=="ended" or e.phase=="cancelled" then

			if count==1 then
	
				composer.gotoScene( "scene3","fade",600 )
			end	
		end
		-- body
	end
	-----------------------------------------------------------------------------
	group:addEventListener("touch",group)

	elseif phase =="did" then


	end
end


-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view
	local phase = event.phase 

	if phase == "will" then

	elseif phase == "did" then	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
		group:removeEventListener("touch",group)
	end
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
end

-----------------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene