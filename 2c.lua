----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()

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
		fondo= display.newImageRect("2b.png",1024,768)
		fondo.x=_W/2
		fondo.y=_H/2

		group:insert(fondo)	
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view
	local phase = event.phase
	
	if phase == "will" then--------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
			-- function ver()
			-- oso2.isVisible=true	
			-- transition.to(oso2,{alpha=1,time=500,})
			-- end
			-- function showOso(  )
			-- 	fondo2.isVisible=true
			-- 	transition.to(fondo2,{alpha=1,time=1500})
			-- 	transition.to(oso,{alpha=1,y=_H/2,time=1500,onComplete=ver})
			-- end
			-- function show3( ... )
			-- 	texto3.isVisible=true
			-- 	transition.to(texto3,{alpha=1,time=500,})
			-- end

			-- function show2( ... )
			-- 	texto2.isVisible=true
			-- 	transition.to(texto2,{alpha=1,time=500,onComplete=show3})
			-- end

			-- function showText(  )
			-- 	texto.isVisible=true
			-- 	transition.to(texto,{alpha=1,time=500,onComplete=show2})
		
			-- end
			local count = 1
		function group:touch( e )
			if e.phase=="ended" or e.phase=="cancelled" then

				if count==1 then
		
				composer.gotoScene( "menu" )
				end	
			end
			-- body
		end
		-----------------------------------------------------------------------------
		group:addEventListener("touch",group)


	elseif phase == "did" then

	end	

end


-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
		group:removeEventListener("touch",group)
	end
end


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

