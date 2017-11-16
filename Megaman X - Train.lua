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

--------------
----PARAMETERS
--------------
memory.usememorydomain("CARTROM")

local State_filename = "T4_Bordini.State"
local Dataset_filename = "Dataset.txt"

local input_size = 16 -- defines an 16x16 input matrix

-- SNES resolution is 256 x 224
local x_cell_size = math.floor( 256 / input_size  ) 
local y_cell_size = math.floor( 224  / input_size  )

--2byes
--ADDRESS FOR MEGAMAN'S POSITION
local mega_x_addr = 0xBAD
local mega_y_addr = 0xBB0

local mega_facing_addr = 0xBA8 + 0x11

--2bytes
--ADRESS FOR CAMERA'S POSITION
local cam_x_addr = 0x00B4
local cam_y_addr = 0x00B6

--a byte
--ADDRESS FOR BOSS HEALTH
local boss_health_addr = 0x0E8F	
local mega_health_addr = 0x0BCF

--COLORS
local fill_color1 = 0x40FF0000
local outl_color1 = 0xFFFF0000
local fill_color2 = 0x40FFFFFF
local outl_color2 = 0xFFFFFFFF
local fill_color3 = 0x40FFFF00
local outl_color3 = 0xFFFFFF00
local fill_color4 = 0x4000FF00

--OBJECT SIZE
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

local megaman_map_weight = 200.0
local boss_map_weight = 100.0
local bullets_map_weight = 50.0

-- Number of iterations to record
local iterations = 1

local dataset_file = "Dataset.txt"

----------------
---END PARAMETERS
----------------

---------------
---GAMESTATE---
---------------

-- Reads current game state.
-- Defines an input matrix based on objects on screen and their positions
-- Worries about projectiles, enemies and mega man

local function create_input_table()
	local input_table = {}
	--console.log("Input size: " .. input_size)
	for i = 0, input_size-1 do
		input_table[i] = {}
		for j = 0, input_size-1 do
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

local function map_X(table, camx, camy)
	local mm_x = mainmemory.read_u16_le(mega_x_addr) + 1 - camx
	local mm_y = mainmemory.read_u16_le(mega_y_addr) + 1 - camy
	local mm_facing = mainmemory.read_u8(mega_facing_addr)
	local cellx = math.floor(mm_x / x_cell_size)
	local celly = math.floor(mm_y / y_cell_size)
	--console.log("Mega Man at " .. cellx .. " " .. celly)
	
	if mm_facing > 0x45 then
		table[cellx][celly] = megaman_map_weight + 10
	else
		table[cellx][celly] = megaman_map_weight - 10
	end

end

local function map_objects(table, camx, camy, base_addr, weight)
	local write = 0x01
	for i = 0, 14 do
		local obj_addr = base_addr + i * obj_step
		write = mainmemory.readbyte( obj_addr )

		if write and write ~= 0x00 then
			local obj_x = mainmemory.read_u16_le(obj_addr + 0x5) +1 - camx
			local obj_y = mainmemory.read_u16_le(obj_addr + 0x8) +1 - camy
			local cellx = math.floor(obj_x / x_cell_size)
			local celly = math.floor(obj_y / y_cell_size)
			if cellx < input_size and cellx >= 0  and celly < input_size and celly >=0  then
				--console.log("obj x y: " .. math.floor(obj_x / x_cell_size).. " " .. math.floor(obj_y / y_cell_size))
				table[ cellx ][celly ] = weight 
			end
		end
	end
	return table
end	

local function map_enemies(table, camx, camy)
	return map_objects(table, camx, camy, enemies_addr_start, boss_map_weight)
end

local function map_bullets(table, camx, camy)
	return map_objects(table, camx, camy, bullets_addr_start, bullets_map_weight)
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
	
	--console.log(#table)

	for i = 0, #table do
		for j = 0, #table do
			local table_value = table[i][j]
			if table_value then
				if table_value == megaman_map_weight then
					fill = fill_color4
					outl = outl_color4
				elseif table_value == boss_map_weight then
					fill = fill_color1
					outl = outl_color1
				elseif table_value == bullets_map_weight then
					fill = fill_color3
					outl = outl_color3
				else
					fill = fill_color2
					outl = outl_color2
				end
				gui.drawBox(x_start + 8 * i, y_start +  8* j, x_start + 8* i + 8, y_start + 8* j + 8 , fill, fill)
			end
		end
	end
end

---------------
--END GAMESTATE
---------------

--------------
--- INPUTS----
--------------

ButtonNames = {
	"B", -- Jump
	"Y", --Shoot
	"Left", --Moves left
 	"Right" --Moves right, unsurpisingly
}

--List of to be pressed inputs
local function clear_inputs(inputs)
	for i=1, #ButtonNames do	
		inputs["P1 " .. ButtonNames[i]] = false
	end
end

local function button_to_output(buttons, outputs)
	for i=1, #ButtonNames do
		if buttons[i] then
			outputs[i] = 1.0
		else
			outputs[i] = 0.0
		end
	end
end

--------------
---END INPUTS-
--------------

--------------
----DATASET---
--------------

-- magiclines extracted from somewhere on the internets, not our code
-- code by user lhf at stackoverflow
-- https://stackoverflow.com/questions/19326368/iterate-over-lines-including-blank-lines
function magiclines(s)
        if s:sub(-1)~="\n" then s=s.."\n" end
        return s:gmatch("(.-)\n")
end

local function read_dataset(dataset)
	local f = io.open(Dataset_filename,"w")
	local t = f:read("*all")

	-- for each dataset entry
	for line in magiclines(t) do

		-- Parses the line
		local l = line:gsub("^%s*(.-)%s*$", "%1")
		local num_iter = string.gmatch(l,'[0-9]+')

		local i = num_iter()
		if i == nil then
			break
		end

		dataset[i] = {}
		dataset[i]['output'] = {}

		for o=1, #ButtonNames do
			dataset[i]['output'][o] = num_iter()
		end

		dataset[i]['table'] = {}

		for m = 0, input_size-1 do
		dataset[i]['table'][i][m] = {}
			for n = 0, input_size-1 do
				dataset[i]['table'][m][n] = num_iter()
			end
		end

	end
	f:close()
end

local function record_state(dataset, input_table, output, iteration)

	dataset[iteration] = {}

	dataset[iteration]['table'] = {}

	for i = 0, input_size-1 do
		dataset[iteration]['table'][i] = {}
		for j = 0, input_size-1 do
			dataset[iteration]['table'][i][j] = input_table[i][j]
		end
	end
	
	dataset[iteration]['output'] = {}
	for i=1, #output do
		dataset[iteration]['output'][i] = output[i]
	end
	return dataset
end

local function write_dataset(dataset)
	local f = io.open("Dataset.txt","w")

	for frame=1, #dataset do
		f:write(tostring(frame) .. " ")

		for o=1, #ButtonNames do
			f:write(tostring(dataset[frame]['output'][o]) .. " ")
		end

		for i = 0, input_size-1 do
			for j = 0, input_size-1 do
				f:write(tostring(dataset[frame]['table'][i][j]) .. " ")
			end
		end
		f:write("\n")
	end
	f:close()
end


--------------
---END DATASET
--------------

----------------
--NEURAL NETWORK
----------------
local function sigmoid(x)
	return 1 / (1 + (math.exp(2.72, -x)))
end

local function threshold (x)
	if (x > 0.5) then return 1.0 else return 0.0 end
end

local function activate_neuron(layer, neuron)
	local sum = 0.0
	for i=1, #layer do
		sum = sum + neuron[i] * layer[i]['value']()
	end
	--console.log('neuron activated')
	neuron['value'] = (function() return sigmoid(sum) end)
end

local function create_neuron(previous_layer)
	local neuron = {}
	for i=1, #previous_layer do
		neuron[i] = 0.0
	end
	neuron['activate'] = (function() return activate_neuron(previous_layer, neuron) end)
	return neuron
end

local function activate_layer(previous_layer, layer)
	for i=1, #layer do
		layer[i]['activate'](previous_layer)
	end
end

local function create_layer( previous_layer, size)
	local layer = {}
	for i=1, size do
		layer[i] = create_neuron(previous_layer)
	end
	layer['activate'] = (function() return activate_layer(previous_layer, layer) end)
	return layer
end


local function input_to_layer(input_table)
	local layer = {	}
	for i=0, (input_size * input_size )-1 do
		layer[i+1] = {}
		local cellx = math.floor(i / input_size)
		local celly = (i)  % input_size
		--console.log(cellx, celly)
		layer[i+1]['value'] = function() return  input_table[cellx][celly] end
	end
	layer['activate'] = function() return end
	return layer
end	

local layer_names = {'layer1', 'layer2', 'output_layer'} --, 'layer4'}

local function random_weight() return ((math.random()*2) -1) end

local function create_network(input_layer)
	local network = {}
	specimen['layer1'] = create_layer(input_layer, 16)
	specimen['layer2'] = create_layer(specimen['layer1'], 8) 
	--specimen['layer3'] = create_layer(specimen['layer2'], 8)
	specimen['output_layer'] = create_layer(specimen['layer2'], 4)
	return network
end

local function activate_specimen(spec)
	for j=1, #layer_names do
		for i=1, #(spec[layer_names[j]]) do
			spec[layer_names[j]]['activate']()
		end	
	end
end

local function load_weights(network)

end

local function write_weights(network)

end

---------------------
---END NEURAL NETWORK
---------------------

local input_table = create_input_table()

local current_generation = 0

local inputs = {}
clear_inputs(inputs)

local dataset = {}

local outputs = {}
	
local frame = 1

local mode = 'train'

while true do
	-- scaler()
	-- if draw_megaman == true then
	-- 	megaman()
	-- end
	-- if draw_enemies == true then
	-- 	enemies()
	-- end


	while iterations > 0 do
		savestate.load(State_filename);

		-- sets Mega's max  and current health to the maximum possible
		--This is just so each run runs longer.
		mainmemory.writebyte(0x1F9A, 0x20)
		mainmemory.writebyte(0x0BCF, 0x20)

		while mainmemory.readbyte( mega_health_addr ) > 0 and mainmemory.readbyte( boss_health_addr ) > 0 do
			
			map_input_table(input_table)

			draw_input_table(input_table)

			--mainmemory.readbyte( 0x0E8F  )
 			
			 gui.drawText(0, 24+150, "Boss HP: " .. tostring(mainmemory.readbyte( boss_health_addr )), color, 9)
			-- gui.drawText(0, 24+150, "HP: " .. tostring(mainmemory.readbyte( mega_health_addr   )), color, 9)

			-- gui.drawText(0, 24+120, "Buttons: " .. 'B ' .. tostring( inputs['P1 B']), color, 7)
			-- gui.drawText(0, 24+110, "Buttons: " .. 'Y ' .. tostring( inputs['P1 Y']), color, 7)
			-- gui.drawText(0, 24+100, "Buttons: " .. 'R ' .. tostring( inputs['P1 Right']), color, 7)
			-- gui.drawText(0, 24+90, "Buttons: " .. 'L ' .. tostring( inputs['P1 Left']), color, 7)

			emu.frameadvance()
			
			local buttons = joypad.get()

			button_to_output(buttons, outputs)

			dataset = record_state(dataset, input_table, outputs, frame)

			frame = frame + 1
		end
		iterations = iterations - 1
	end
	--mainmemory.writebyte(0x0BFF, 0x4F)
	write_dataset(dataset)
	break
end