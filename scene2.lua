----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()

local sombra,sombra2 
local avalieble
local fondo2,fondo,contraste
local pixieA,pic,pics
local flecha,fb,fc
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
		 contraste =display.newImageRect("escena2.png",_W,_H)
		contraste.x=_W/2
		contraste.y=_H/2
		avalieble=false
	-----------------------------------------------------------------------------
		pixieA= display.newImage("pixie2A.png",0,0)
		pixieA.x=_W/2 -286
		pixieA.y=_H/2-28

		
		pic= display.newImage("pixie2B.png",0,0)
		pic.x=_W/2-190
		pic.y=_H/2-70

		pics= display.newImage("pixie2C.png",0,0)
		pics.x=_W/2 -250
		pics.y=_H/2-85

	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
		sombra = display.newImage("sombra2.png",450,1000)
		sombra.alpha=0.2
		sombra.y=700
		sombra.isVisible=false

		sombra2 = display.newImage("brazo2.png",450,500)		
		sombra2.alpha=0.2
		sombra2.isVisible=false

	function pixieA:touch( e )
		if e.phase=="ended" and avalieble == true then
			composer.gotoScene( "scene2a","fade",500 )
		end	
	end
	pixieA:addEventListener("touch",pixieA)


	function pic:touch( e )
		if e.phase=="ended" and avalieble == true then
			composer.gotoScene( "2b","fade",500 )
		end	
	end
	pic:addEventListener("touch",pic)


	function pics:touch( e )
		if e.phase=="ended" and avalieble == true then
			composer.gotoScene( "2c" ,"fade",500)
		end	
	end
	pics:addEventListener("touch",pics)


		flecha= display.newImageRect("flecha.png",30,70)
		flecha.x=pixieA.x
		flecha.y=pixieA.y-100
		flecha.isVisible=false

		fb= display.newImageRect("flecha.png",30,70)
		fb.x=_W/2-200
		fb.y=pic.y-70
		fb.isVisible=false

		fc= display.newImageRect("flecha.png",30,70)
		fc.x=pics.x
		fc.y=pics.y-100
		fc.isVisible=false

		group:insert(contraste)
		group:insert(pixieA)
		group:insert(pic)
		group:insert(pics)
		group:insert(sombra)
		group:insert(sombra2)
--		group:insert(fondo)	
--		group:insert(fondo2)
--		group:insert(pixie)
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
	local count = 1
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
			function ver()
			sombra2.isVisible=true	
			transition.to(sombra2,{alpha=1,time=500,})
			end
			function showsombra(  )
				sombra.isVisible=true
--				transition.to(fondo2,{alpha=1,time=1500})
				transition.to(sombra,{alpha=1,y=450,time=1500,onComplete=ver})
			end
			function show3( ... )
--				texto3.isVisible=true
--				transition.to(texto3,{alpha=1,time=500,})
			end

			function show2( ... )
--				texto2.isVisible=true
--				transition.to(texto2,{alpha=1,time=500,onComplete=show3})
			end

			function showText(  )
				--sombra.isVisible=true
				transition.to(sombra,{alpha=1,time=500,onComplete=show2})
		
			end
	function group:touch( e )
		if e.phase=="ended" then

			if count==1 then
			transition.to(group,{xScale=1.8,yScale=1.8,time=1000,x=self.x-230,y=self.y-310,onComplete=showText})
			count=2
			elseif count==2 then
				showsombra()
		--		group.xScale=1
		--		group.yScale=1
			count=3
			elseif count==3 then
		fc.isVisible=true
		fb.isVisible=true
		flecha.isVisible=true
		sombra2.isVisible=false
		sombra.isVisible=false

		--	count=1
		avalieble=true
		--	storyboard.gotoScene( "scene3" )
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
	sombra2.alpha=0.2
	sombra2.isVisible=false
	-----------------------------------------------------------------------------
	sombra.y=700
	sombra.isVisible=false		
	sombra.alpha=0.2

	fc.isVisible=false
	fb.isVisible=false	
	flecha.isVisible=false
	avalieble=false
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
