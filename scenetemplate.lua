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
		 contraste =display.newImageRect("fondo.png",_W,_H)
		contraste.x=_W/2
		contraste.y=_H/2
	-----------------------------------------------------------------------------
		fondo= display.newImageRect("esc1.png",1024,768)
		fondo.x=_W/2
		fondo.y=_H/2

		fondo2= display.newImageRect("esc2.png",1024,768)
		fondo2.x=_W/2
		fondo2.alpha=0.1
		fondo2.y=_H/2
		fondo2.isVisible=false
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
		oso = display.newImage("OsoNesc1.png",490,1000)
		oso.alpha=0.2
		oso2 = display.newImage("OsoCesc1.png",490,300)
		oso2.y=_H/2
		oso2.alpha=0.2
		oso2.isVisible=false



		texto=display.newImage("texto1.png",0,0)
		texto.alpha=0.2
		texto.isVisible=false
		texto.x=550
		texto.y=480

		texto2=display.newImage("texto2.png",0,0)
		texto2.alpha=0.2
		texto2.isVisible=false
		texto2.x=650
		texto2.y=500

		texto3=display.newImage("texto3.png",0,0)
		texto3.alpha=0.2
		texto3.isVisible=false
		texto3.x=750
		texto3.y=480

		group:insert(contraste)
		group:insert(oso)
		group:insert(oso2)
		group:insert(fondo)	
		group:insert(fondo2)
--		group:insert(pixie)
		group:insert(texto)
		group:insert(texto2)
		group:insert(texto3)

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

	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
			function ver()
			oso2.isVisible=true	
			transition.to(oso2,{alpha=1,time=500,})
			end
			function showOso(  )
				fondo2.isVisible=true
				transition.to(fondo2,{alpha=1,time=1000})
				transition.to(oso,{alpha=1,y=_H/2,time=1500,onComplete=ver})
			end
			function show3( ... )
				texto3.isVisible=true
				transition.to(texto3,{alpha=1,time=300,})
			end

			function show2( ... )
				texto2.isVisible=true
				transition.to(texto2,{alpha=1,time=300,onComplete=show3})
			end

			function showText(  )
				texto.isVisible=true
				transition.to(texto,{alpha=1,time=300,onComplete=show2})
		
			end
			local count = 1
	function group:touch( e )
		if e.phase=="ended" or e.phase=="cancelled" then

			if count==1 then
				transition.to(group,{xScale=1.8,yScale=1.8,time=1000,x=self.x-570,y=self.y-510,onComplete=showText})

		--		group.xScale=2
		--		group.yScale=2
			count=2
			elseif count==2 then
				transition.to(group,{xScale=1.0,yScale=1,time=1000,x=self.x+570,y=self.y+510,onComplete=showOso})
				texto.isVisible=false
				texto.alpha=0.2
				texto2.isVisible=false
				texto2.alpha=0.2
				texto3.isVisible=false
				texto3.alpha=0.2

		--		group.xScale=1
		--		group.yScale=1
			count=3
			elseif count==3 then
				oso2.isVisible=false
				oso.y=1000
				fondo2.isVisible=false
				fondo2.alpha=0.2
			count=1
		composer.gotoScene( "scene2", "fade", 500 )
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
