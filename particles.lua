local ffi=require("ffi")
local tcod=require("header")
local zlib=require("zlib")

local key=ffi.new("TCOD_key_t")
local mouse=ffi.new("TCOD_mouse_t")
--[[
	todo:
		common function library (e.g. is_in_wall(x,y), and rgb_to_hsv ,etc...)
		allow loading different file for particle functions
		particles simulating energy running through lines
		* turing complete simulations?
	possible effect ideas:
		heat (fade through palette)
		smoke (dissipate, spawns smaller particles)
		laser/lightning (walks more than 1 tile with sub particles dropping down)

]]

function s_to_number(s)
	local ret=0
	for i=1,#s do
		ret=bit.bor(bit.lshift(string.byte (s, i),(i-1)*8),ret)
	end
	return ret
end
function load_cell(file)
	local ret={}
	ret[1]=s_to_number(file:read(4))
	for i=1,6 do
		ret[i+1]=file:read(1):byte()
	end
	return ret
end
function load_rex_file( filename )
	local ret={}
	local file=zlib.open(filename)

	ret.version=s_to_number(file:read(4))
	ret.layer_count=s_to_number(file:read(4))
	assert(ret.layer_count<=4)
	ret.layers={}
	for i=1,ret.layer_count do
		local layer={}
		layer.w=s_to_number(file:read(4))
		layer.h=s_to_number(file:read(4))
		for i=1,layer.w*layer.h do
			layer[i]=load_cell(file)
		end
		ret.layers[i]=layer
	end

	return ret
end

function parse_layer(layer,emitter_f)
	local ret={walls={},emitters={},particles={}}
	for x=0,layer.w-1 do
	for y=0,layer.h-1 do
		local cell=layer[y+x*layer.h+1]
		local fore={}
		local back = {}
		if cell[1]~=32 then
			
			if cell[1]>1 and cell[1]<("z"):byte() then
				fore.r=cell[2]
				fore.g=cell[3]
				fore.b=cell[4]

				back.r=cell[5]
				back.g=cell[6]
				back.b=cell[7]
				if emitter_f[cell[1]]==nil then
					print(string.format("Warning, emitter found with id %d (%s) and no emitance function at %d,%d",cell[1],string.char(cell[1]),
							x,y))
				end
				table.insert(ret.emitters,{x=x,y=y,fore=fore,back=back,img=cell[1],emit=emitter_f[cell[1]]})
			
			else
				ret.walls[y+x*layer.h+1]=cell[1]
			end
		end
	end
	end
	ret.w=layer.w
	ret.h=layer.h
	return ret
end
function form_rgb(t,off)
	off=off or 0
	return {r=t[1+off],g=t[2+off],b=t[3+off]}
end
function load_animated(file)
	local rxfile=load_rex_file(file)
	local layer=rxfile.layers[1]
	local ret={}
	for y=0,layer.h-1 do
		local frames={}
		for x=0,layer.w-1 do
			local cell=layer[y+x*layer.h+1]
			if cell[1]==0 then
				break
			else
				table.insert(frames,{img=cell[1],fore=form_rgb(cell,1),back=form_rgb(cell,4)})
			end
		end
		table.insert(ret,frames)
	end
	return ret
end
function draw_layer(layer)
	local fore=ffi.new("TCOD_color_t")
	local back=ffi.new("TCOD_color_t")
	for x=0,layer.w-1 do
	for y=0,layer.h-1 do
		--print(x,y)

		local cell=layer[y+x*layer.h+1]
		fore.r=cell[2]
		fore.g=cell[3]
		fore.b=cell[4]

		back.r=cell[5]
		back.g=cell[6]
		back.b=cell[7]
		if back.r~=255 or back.g~=0 or back.b~=255 then
			tcod.console.put_char_ex(nil,x,y,cell[1],fore,back)
		else
			tcod.console.put_char_ex(nil,x,y,32,tcod.lib.TCOD_black,tcod.lib.TCOD_black)
		end
	end
	end
end
function tick_particles(data)
	local new_list={}
	for i,v in ipairs(data.particles) do
		if v.tick then 
			v.tick(v,data,new_list)
		end
	end

	local i=1
	while i <= #data.particles do
    	if data.particles[i].life<=0 then
        	table.remove(data.particles, i)
    	else
        	i = i + 1
    	end
	end
	for i,v in ipairs(new_list) do
		table.insert(data.particles,v)
	end
end
function tick_emitters(data)
	for i,v in ipairs(data.emitters) do
		if v.emit then v.emit(v,data) end
		--table.insert(data.particles,{x=v.x,y=v.y,life=math.random(5,25),gravity=false,img=v.img,fore=v.fore,back=v.back})
	end
end
function draw_particles(data)
	for i,v in ipairs(data.particles) do
		if v.back.r~=255 or v.back.g~=0 or v.back.b~=255 then
			print(v.back.r,v.back.g,v.back.b)
			tcod.console.put_char_ex(nil,v.x,v.y,v.img,v.fore,v.back)
		else
			tcod.console.set_char(nil,v.x,v.y,v.img)
			tcod.console.set_char_foreground(nil,v.x,v.y,v.fore)
		end
	end
end
function decode_callbacks(callbacks)
	local ret={}
	for k,v in pairs(callbacks) do
		if type(k)=='string' then
			ret[k:byte()]=v
		else
			ret[k]=v
		end
	end
	return ret
end
function get_tile(data,x,y )
	return data.image[y+x*data.h+1]
end
function run(map_file,particle_functions )
	local file=load_rex_file(map_file)

	local w=0
	local h=0
	for i,v in ipairs(file.layers) do

		if v.w>w then w=v.w end
		if v.h>h then h=v.h end
	end

	tcod.console.set_custom_font("cp437_10x10.png",tcod.FONT_LAYOUT_ASCII_INROW,16,16)
	tcod.console.init_root(w,h,"RexParticles",false,tcod.lib.TCOD_RENDERER_SDL)

	tcod.sys.set_fps(30)
	print("INIT OK!")

	local map=parse_layer(file.layers[2],decode_callbacks(particle_functions))
	map.image=file.layers[1]
	map.mouse=mouse
	map.key=key
	map.get_tile=get_tile
	while not tcod.console.is_window_closed() do
		tcod.sys.check_for_event(tcod.lib.TCOD_EVENT_ANY,key,mouse)
		if key.c==string.byte("q") then
			break
		end
		tick_emitters(map)
		tick_particles(map)
		draw_layer(file.layers[1])
		draw_particles(map)
		tcod.console.flush()
	end
end
local ret={
	run=run,
	load_animated=load_animated
}
local lib=require 'library'
for k,v in pairs(lib) do
	ret[k]=v
end
return ret