----------------------------------------------------------------------------------
--	scene 3
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local oso,oso2 

local fondo2,fondo,contraste
----------------------------------------------------------------------------------
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
		fondo= display.newImageRect("escena3.png",1024,768)
		fondo.x=_W/2
		fondo.y=_H/2


		flecha= display.newImageRect("flecha.png",70,100)
		flecha.x=_W/2
		flecha.y=_H/2 -39
		flecha.rotation=210

		fb= display.newImageRect("flecha.png",70,100)
		fb.x=_W/2-200
		fb.y=_H/2
		fb.rotation=180
		fc= display.newImageRect("flecha.png",70,100)
		fc.x=_W/2+200
		fc.y=_H/2+50
		fc.rotation=210


		function flecha:touch( e )
			if e.phase=="ended" then
				composer.gotoScene("final")
			end
			-- body
		end

		function fb:touch( e )
			if e.phase=="ended" then
				composer.gotoScene("3b")
			end
			-- body
		end
		function fc:touch( e )
			if e.phase=="ended" then
				composer.gotoScene("3a")
			end
			-- body
		end

		flecha:addEventListener("touch",flecha)
		fb:addEventListener("touch",fb)
		fc:addEventListener("touch",fc)
		group:insert(fondo)	
		group:insert(flecha)	
		group:insert(fb)
		group:insert(fc)		
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view
	
	local phase = event.phase 

	if phase == "will" then

	elseif phase =="did" then
	
	end	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
----------------------------------------------------------
--	group:addEventListener("touch",group)
end


-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view
	

	local phase = event.phase 

	if phase == "will" then

	elseif phase =="did" then
	
	end	
	----------------------------------------------------------------------------
--		group:removeEventListener("touch",group)
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end

-----------------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
