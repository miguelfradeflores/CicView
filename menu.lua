----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()

local opcion,fondo,contraste
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

function scene:create( event )
	local group = self.view
		 contraste =display.newImage("LOGO 2.png",0,217)
		contraste.x=_W/2
		contraste.y=200
	-----------------------------------------------------------------------------
		fondo= display.newRect(0,0,1024,768)
		fondo.x=_W/2
		fondo.y=_H/2
		fondo:setFillColor(0,0,0)

		opcion= display.newRect(0,0,1024,68)
		opcion.x=_W/2
		opcion.alpha=0.5
		opcion.y=_H/2 +100
		opcion:setFillColor(15/255,50/255,120/255)

		texto= display.newText("1)         Pixies",_W/2-300,opcion.y,"arial",35)
	--	opcion.isVisible=false
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.

		opcionb= display.newRect(0,0,1024,68)
		opcionb.x=_W/2
		opcionb.alpha=0.5
		opcionb.y=_H/2 +200
		opcionb:setFillColor(15/255,50/255,120/255)

		texto2= display.newText("2)         Video Game Comic",_W/2-200,opcionb.y,"arial",35)

		function opcion:touch( e )
			if e.phase=="ended" then

			composer.gotoScene( "inicio", "fade", 500 )
			end
		end

		opcion:addEventListener("touch",opcion)

	function opcionb:touch( e )
			if e.phase=="ended" then
				composer.gotoScene( "page1", "fade", 500 )
			end
		end

		opcionb:addEventListener("touch",opcionb)
		group:insert(fondo)	
		group:insert(contraste)
--		group:insert(oso2)

		group:insert(opcion)
		group:insert(texto)
		group:insert(opcionb)
		group:insert(texto2)


	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is on screen and is about to move off screen

		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then

	end	

	-----------------------------------------------------------------------------
end


-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
	elseif phase == "did" then

		-- Called when the scene is now off screen
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
