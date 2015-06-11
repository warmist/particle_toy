local lib={}
local tcod=require("header")
--utility functions
function lib.get_wall(x,y,data )
	return data.walls[y+x*data.h+1]
end
function lib.copyall(a)
	local ret={}
	for k,v in pairs(a) do
		ret[k]=v
	end
	return ret
end

local tiles_connects={
	[196]={{x=-1},{x=1}},  --TCOD_CHAR_HLINE
	[179]={{y=-1},{y=1}},  --TCOD_CHAR_VLINE
	[191]={{x=-1},{y=1}},  --TCOD_CHAR_NE
	[218]={{x=1},{y=1}},  --TCOD_CHAR_NW
	[217]={{x=-1},{y=-1}},  --TCOD_CHAR_SE
	[192]={{x=1},{y=-1}},  --TCOD_CHAR_SW
	[180]={{y=-1},{y=1},{x=-1}},  --TCOD_CHAR_TEEW  -- ~East
	[195]={{y=-1},{y=1},{x=1}},  --TCOD_CHAR_TEEE -- ~West
	[193]={{x=-1},{x=1},{y=-1}},  --TCOD_CHAR_TEEN
	[194]={{x=-1},{x=1},{y=1}},  --TCOD_CHAR_TEES
	[197]={{x=-1},{x=1},{y=-1},{y=1}},  --TCOD_CHAR_CROSS

	[205]={{x=-1},{x=1}},  --TCOD_CHAR_DHLINE
	[186]={{y=-1},{y=1}},  --TCOD_CHAR_DVLINE
	[187]={{x=-1},{y=1}},  --TCOD_CHAR_DNE
	[201]={{x=1},{y=1}}, --TCOD_CHAR_DNW
	[188]={{x=-1},{y=-1}},   --TCOD_CHAR_DSE
	[200]={{x=1},{y=-1}},  --TCOD_CHAR_DSW
	[185]={{y=-1},{y=1},{x=-1}},  --TCOD_CHAR_DTEEW
	[204]={{y=-1},{y=1},{x=1}},   --TCOD_CHAR_DTEEE
	[202]={{x=-1},{x=1},{y=-1}},  --TCOD_CHAR_DTEEN
	[203]={{x=-1},{x=1},{y=1}},   --TCOD_CHAR_DTEES
	[206]={{x=-1},{x=1},{y=-1},{y=1}}, --TCOD_CHAR_DCROSS


}
function lib.is_circuit(tile)
	return tiles_connects[tile]~=nil
end
function lib.connects(tile,dx,dy )
	if dx~= 0 and dy ~=0 then
		return false
	end
	local tt=tiles_connects[tile]
	if tt==nil then
		return false
	end
	for i,v in ipairs(tt) do
		if v.x and v.x==dx then
			return true
		end
		if v.y and v.y==dy then
			return true
		end
	end
end
--particle callbacks
function select_frame(p,frame)
	p.frame=frame
	local cur_frame=p.frames[frame]
	p.img=cur_frame.img
	if p.anim_fore then
		p.fore=cur_frame.fore
	end
	if p.anim_back then
		p.back=cur_frame.back
	end
end
function lib.tick_animate(p,data)
	if !p.animation then error("Particle does not have animation") end
	select_frame(p,math.fmod(p.frame+1,#p.frames)+1)
end
function lib.tick_rand_frame(p,data)
	if !p.animation then error("Particle does not have animation") end
	select_frame(p,math.random(1,#p.frames))
end
function lib.tick_fade(p,data) --a fading emmisive material
	--TODO: emissive rendering should ADD it's light to background
	if type(p.fore)=='table' then
		local tmp=require("ffi").new("TCOD_color_t")
		tmp.r=p.fore.r
		tmp.g=p.fore.g
		tmp.b=p.fore.b
		p.fore=tmp
	end
	tcod.color.scale_HSV(p.fore,0.96,1)--TODO: @param here
	p.life=p.life-1
end
function lib.overlay(p,data) --use background image, only change colors
	p.img=data.image[p.y+p.x*data.h+1][1]
end
function lib.move_wall( p,data,new_particles )
	local nx=p.x+math.random(-1,1)
	local ny=p.y+math.random(-1,1)
	if lib.is_in_wall(nx,ny,data) then
		p.x=nx
		p.y=ny
		return true
	end
end

function lib.move_circuit( p,data,new_particles )
	local dx=0
	local dy=0
	if math.random()>0.5 then
		dx=math.random(-1,1)
	else
		dy=math.random(-1,1)
	end
	local from_img=data.walls[p.y+p.x*data.h+1]
	if lib.connects(from_img,dx,dy) then
		p.x=p.x+dx
		p.y=p.y+dy
		return true,dx,dy
	else
		return false,dx,dy
	end
end
function lib.move_float(p,data,new_particles)
	local nx=p.x+math.random(-1,1)
	local ny=p.y+math.random(-1,1)
	if not lib.get_wall(nx,ny,data) then
		p.x=nx
		p.y=ny
		return true
	end
end
function lib.sign(x)
	if x> 0 then
		return 1
	elseif x<0 then
		return -1
	else
		return 0
	end
end
function round( x )
	return math.floor(math.abs(x))*lib.sign(x)
end
function lib.move_dir(p)
	local dir=p.dir or 0
	local f_part=p.f_part or {0,0}
	p.f_part=f_part
	local speed=p.speed or 1

	f_part[1]=math.cos(dir)*speed+f_part[1]
	f_part[2]=math.sin(dir)*speed+f_part[2]
	local nx=p.x
	local ny=p.y
	if math.abs(f_part[1])>=1 then
		nx=nx+round(f_part[1])
		f_part[1]=f_part[1]-round(f_part[1])
	end
	if math.abs(f_part[2])>=1 then
		ny=ny+round(f_part[2])
		f_part[2]=f_part[2]-round(f_part[2])
	end

	return nx,ny
end
function lib.move_meander(p,data)
	p.dir=p.dir or 0
	local nx,ny=lib.move_dir(p)
	p.dir=p.dir+math.random()*0.1-0.05 --TODO: @param here
	if not lib.get_wall(nx,ny,data) then
		p.x=nx
		p.y=ny
		return true
	end
end
function lib.move_laser(p,data,new_particles)
	local nx,ny=lib.move_dir(p)
	if not lib.get_wall(nx,ny,data) then
		p.x=nx
		p.y=ny
		return true
	end
end
--emmiters
return lib