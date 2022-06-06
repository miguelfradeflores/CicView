--Escena 3a 
--------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local oso,oso2 

local fondo2,fondo,contraste
----------------------------------------------------------------------------------

---------------------------------------------------------------------------------
local _W = display.contentWidth
local _H = display.contentHeight
---------------------------------------------------------------------------------


function scene:create( event )
	local group = self.view

	-----------------------------------------------------------------------------
		fondo= display.newImageRect("escena3a.png",1024,768)
		fondo.x=_W/2
		fondo.y=_H/2

		group:insert(fondo)	

	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view
	local phase = event.phase

	local count = 1

	function group:touch( e )
		if e.phase=="ended" or e.phase=="cancelled" then

			if count==1 then
	
			composer.gotoScene( "scenetemplate" )
			end	
		end
		-- body
	end

	if phase =="will" then

	-----------------------------------------------------------------------------

	elseif phase == "did" then

	group:addEventListener("touch",group)


	end	


end

-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view
	-----------------------------------------------------------------------------
	local phase = event.phase
	if phase == "will" then

		group:removeEventListener("touch",group)

	elseif phase == "did" then

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