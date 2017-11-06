--Author Pasky13's examples

---------------
----GLOBALS----
---------------
-- local pbase = 0xBA8
-- local px = 0xBAD
-- local py = 0xBB0 
-- local cx = 0x00B4 -- Camera X Position
-- local cy = 0x00B6 -- Camera Y Position

-- -------------
-- --TOGGLES----
-- ---------------
-- local draw_megaman = true
-- local draw_enemies = true
-- local draw_hpvalues = true
-- local draw_projectiles = true
-- --local draw_instantbox = false  -- Bizhawk doesnt support breakpoints

-- local xm
-- local ym

-- -- Breakpoints not yet implemented in bizhawk
-- -- local function draw_instabox(base)
	
-- 	-- local camx = mainmemory.read_u16_le(cx)
-- 	-- local camy = mainmemory.read_u16_le(cy)
-- 	-- local facing = mainmemory.read_u8(base + 0x11)
-- 	-- local x = mainmemory.read_u16_le(base + 5) - camx
-- 	-- local y = mainmemory.read_u16_le(base + 8) - camy
-- 	-- local boxpointer = mainmemory.read_u16_le(base +0x20) + 0x860000
-- 	-- local xoff = mainmemory.read_s8(boxpointer + 0)
-- 	-- local yoff = mainmemory.read_s8(boxpointer + 1)
-- 	-- local xrad = mainmemory.read_u8(boxpointer + 2)
-- 	-- local yrad = mainmemory.read_u8(boxpointer + 3)
	
-- 	-- if facing > 0x45 then
-- 		-- xoff = xoff * -1
-- 	-- end
	
-- 	-- gui.drawBox(x + xoff +xrad,y + yoff + yrad, x + xoff - xrad, y + yoff - yrad,0xFFFF0000,0x05FF0000)
-- -- end

-- memory.usememorydomain("CARTROM")

-- local function megaman()

-- 	local camx = mainmemory.read_u16_le(cx)
-- 	local camy = mainmemory.read_u16_le(cy)
-- 	local x = mainmemory.read_u16_le(px) - camx
-- 	local y = mainmemory.read_u16_le(py) - camy
-- 	local facing = mainmemory.read_u8(pbase + 0x11)
-- 	local boxpointer = mainmemory.read_u16_le(pbase + 0x20) + 0x28000
-- 	local xoff = memory.read_s8(boxpointer + 0)
-- 	local yoff = memory.read_s8(boxpointer + 1)
-- 	local xrad = memory.read_u8(boxpointer + 2)
-- 	local yrad = memory.read_u8(boxpointer + 3)
	
-- 	if facing > 0x45 then
-- 		xoff = xoff * -1
-- 	end
	
-- 	gui.drawBox(x + xoff +xrad,y + yoff + yrad, x + xoff - xrad, y + yoff - yrad,0xFF0000FF,0x400000FF)
-- end


-- -- 
-- local function enemies()

-- 	local x 
-- 	local xoff
-- 	local xrad
-- 	local y
-- 	local yoff
-- 	local yrad
-- 	local camx = mainmemory.read_u16_le(cx)
-- 	local camy = mainmemory.read_u16_le(cy)
-- 	local base
-- 	local boxpointer
-- 	local facing
-- 	local fill
-- 	local outl
-- 	local start = 0xE68
-- 	local oend = 32
	
-- 	for i = 0, oend,1 do
	
-- 		base = start + (i * 0x40)
		
-- 		if i == 0 then
-- 			base = start
-- 		end
		
-- 		if mainmemory.read_u8(base) ~= 0 then
			
-- 			if i > 14 and i < 21 then
-- 				if draw_projectiles == true then
-- 					fill = 0x40FFFFFF
-- 					outl = 0xFFFFFFFF
-- 				else
-- 					fill = 0x00000000
-- 					outl = 0x00000000
-- 				end
-- 			else
-- 				fill = 0x40FF0000
-- 				outl = 0xFFFF0000
-- 			end	
			
-- 			if i > 21 then
-- 				fill = 0x40FFFF00
-- 				outl = 0xFFFFFF00
-- 			end
			
-- 			facing = mainmemory.read_u8(base + 0x11)
-- 			x = mainmemory.read_u16_le(base + 5) - camx
-- 			y = mainmemory.read_u16_le(base + 8) - camy
-- 			boxpointer = mainmemory.read_u16_le(base +0x20) + 0x28000
-- 			xoff = memory.read_s8(boxpointer + 0)
-- 			yoff = memory.read_s8(boxpointer + 1)
-- 			xrad = memory.read_u8(boxpointer + 2)
-- 			yrad = memory.read_u8(boxpointer + 3)
			
		
-- 		if facing > 0x45 then
-- 				xoff = xoff * -1
-- 		end
		
-- 		--Breakpoints not yet implemented in Bizhawk
-- 		-- if draw_instantbox == true then
-- 			-- memory.registerwrite(0x7E0000 + base + 0x20,2,function ()
-- 				-- draw_instabox(memory.getregister("D"))
-- 			-- end)
-- 		-- end
		
-- 		--gui.text(x,y,string.format("%X",base))  -- Debug
-- 		gui.drawBox(x + xoff +xrad,y + yoff + yrad, x + xoff - xrad, y + yoff - yrad,outl, fill)	
			
-- 			if draw_hpvalues == true and mainmemory.read_u8(base+0x27) > 0 then
-- 				if i < 15 or i > 20 then
-- 					gui.text((x-5) * xm,(y-5) * ym,"HP: " .. mainmemory.read_u8(base+0x27))
-- 				end
-- 			end
-- 		end
-- 	end
-- end

-- local function scaler()
-- 	xm = client.screenwidth() / 256
-- 	ym = client.screenheight() / 224
-- end	

-- -- End Author Pasky13's examples


-- Parameters
memory.usememorydomain("CARTROM")

local input_size = 8 -- defines an 8x8 input matrix

-- SNES resolution is 256 x 224
local x_cell_size = math.ceil( 256 / input_size  ) 
local y_cell_size = math.ceil( 224  / input_size  )

--2byes
local mega_x_addr = 0xBAD
local mega_y_addr = 0xBB0

--2bytes
local cam_x_addr = 0x00B4
local cam_y_addr = 0x00B6



 local fill_color1 = 0x40FF0000
 local outl_color1 = 0xFFFF0000

 local fill_color2 = 0x40FFFFFF
 local outl_color2 = 0xFFFFFFFF

local fill_color3 = 0x40FFFF00
local outl_color3 = 0xFFFFFF00

local fill_color4 = 0x4000FF00

local obj_step = 0x40
-- each enemy occupies 64bytes
-- IMPORTANT offsets:
-- $0 = 00 no object, 01 yes object, 1byte
-- $5 x position, 2bytes
-- $8 y position, 2bytes
local enemies_addr_start  = 0x0E68
								
-- each enemy bullet occupies 64bytes
-- IMPORTANT offsets:
-- $0 = 00 no object, 01 yes object, 1byte
-- $5 x position, 2bytes
-- $8 y position, 2bytes
local bullets_addr_start = 0x1428

local function create_input_table()
	local input_table = {}
	console.log("Input size: " .. input_size)
	for i = 0, input_size do
		input_table[i] = {}
		for j = 0, input_size do
			input_table[i][j] = 0
		end
	end
	return input_table
end

local function clear_input_table(table)
	for i = 0, #table do
		for j = 0, #table do
			table[i][j] = 0.0
		end
	end
	return table
end

-- End Parameters

-- Reads current game state.
-- Defines an input matrix based on objects on screen and their positions
-- Worries about projectiles, enemies and mega man

local function map_X(table, camx, camy)
	local mm_x = mainmemory.read_u16_le(mega_x_addr) + 1 - camx
	local mm_y = mainmemory.read_u16_le(mega_y_addr) + 1 - camy
	local cellx = math.floor(mm_x / x_cell_size)
	local celly = math.floor(mm_y / y_cell_size)
	--console.log("Mega Man at " .. cellx .. " " .. celly)
	table[cellx][celly] = 1.0

end

local function map_objects(table, camx, camy, base_addr, weight)
	local write = 0x01
	for i = 1, 15 do
		write = mainmemory.readbyte(base_addr + i * obj_step)
		if write and write ~= 0x01 then
			local obj_x = mainmemory.read_u16_le(base_addr + 0x5) +1 - camx
			local obj_y = mainmemory.read_u16_le(base_addr + 0x8) +1 - camy
			local cellx = math.floor(obj_x / x_cell_size)
			local celly = math.floor(obj_y / y_cell_size)
			if cellx < 9 and cellx >= 0  and celly < 9 and celly >=0  then
				--console.log("obj x y: " .. math.floor(obj_x / x_cell_size).. " " .. math.floor(obj_y / y_cell_size))
				table[ cellx ][celly ] = weight 
			end
		end
	end
	return table
end	

local function map_enemies(table, camx, camy)
	return map_objects(table, camx, camy, enemies_addr_start, 0.5)
end

local function map_bullets(table, camx, camy)
	return map_objects(table, camx, camy, bullets_addr_start, 0.25)
end

local function map_input_table(table)

	clear_input_table(table)

	local camx = mainmemory.read_u16_le(cam_x_addr)
	local camy = mainmemory.read_u16_le(cam_y_addr)

	map_X(table, camx, camy)
	map_enemies(table, camx, camy)
	map_bullets(table, camx, camy)

end

local function draw_input_table(table)

	local x_start = 10
	local y_start = 10
	local fill = 0x40FFFFFF
	local outl = 0xFFFFFFFF

	for i = 0, #table do
		for j = 0, #table do
			local table_value = table[i][j]
			if table_value then
				if table_value == 1.0 then
					fill = fill_color3
					outl = outl_color3
				elseif table_value == 0.5 then
					fill = fill_color2
					outl = outl_color2
				elseif table_value == 0.25 then
					fill = fill_color4
					outl = outl_color4
				else
					fill = fill_color1
					outl = outl_color1
				end
				gui.drawBox(x_start + 4 * i, y_start +  4* j, x_start + 4* i + 4, y_start + 4* j + 4 , fill, fill)
			end
		end
	end
end

local table = create_input_table()

while true do
	-- scaler()
	-- if draw_megaman == true then
	-- 	megaman()
	-- end
	-- if draw_enemies == true then
	-- 	enemies()
	-- end

	--mainmemory.writebyte(0x0BFF, 0x4F)

	map_input_table(table)
	draw_input_table(table)



	emu.frameadvance()
end