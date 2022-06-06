
local composer = require( "composer" )
local scene = composer.newScene()

local Wi = display.contentWidth
local Hi = display.contentHeight
local bg,menudisp, menugroup
local slideView = require("slideView")
	

function scene:create( event )
	local group = self.view

	-- bg = display.newImageRect("version 2/1.jpg",Wi,Hi)
	-- bg.x = Wi*0.5
	-- bg.y = Hi*0.5

--	 group:insert(bg)

	-- local myImages = {
	-- "version 2/1.jpg",
	-- "version 2/2.jpg",
	-- "version 2/3.jpg",
	-- "version 2/4.jpg",
	-- "version 2/5.jpg",
	-- "version 2/6.jpg",
	-- "version 2/7.jpg",
	-- "version 2/8.jpg",
	-- "version 2/9.jpg",
	-- "version 2/13.jpg",
	-- "version 2/11.jpg",
	-- "version 2/12.jpg",
	-- }	

	local myImages ={

	"Comic/pag1.png",
	"Comic/pag2.png",
	"Comic/pg1.png",
	"Comic/pg2.png",
	"Comic/pg3.png",
	"Comic/pg4.png",
	"Comic/pg7.jpg"
	
}	

 	bg =slideView.new( myImages )
--	group:insert(bg)
	
	
end

function scene:show( event )
	local group = self.view

	if(event.phase=="will")then

	elseif(event.phase=="did")then
	
	end	

	
end

function scene:hide( event )
	local group = self.view

	if(event.phase=="will")then

	elseif(event.phase=="did")then
	
	end
	
end



function scene:destroy( event )
	local group = self.view
	
	
end

scene:addEventListener( "create", scene )

scene:addEventListener( "show", scene )

scene:addEventListener( "hide", scene )

scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene		

