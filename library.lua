local lib={}
--utility functions
function lib.is_in_wall(x,y,data )
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
--particle callback-makers
function lib.make_animated(frames, speed,loop ) -- an animated particle
	-- body
end
--particle callbacks
function lib.light_fade() --a fading emmisive material
	-- body
end

function lib.wall_float( p,data,new_particles )
	local nx=p.x+math.random(-1,1)
	local ny=p.y+math.random(-1,1)
	if lib.is_in_wall(nx,ny,data) then
		p.x=nx
		p.y=ny
		p.img=data.image[ny+nx*data.h+1][1]
	end
	p.life=p.life-1
end

function lib.circuit_float( p,data,new_particles )

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
		p.img=data.image[p.y+p.x*data.h+1][1]
	end
	--p.life=p.life-1
end
function lib.wall_float_decay( p,data,new_particles )
	local nx=p.x+math.random(-1,1)
	local ny=p.y+math.random(-1,1)
	if lib.is_in_wall(nx,ny,data) then
		p.x=nx
		p.y=ny
		p.img=data:get_tile(nx,ny)[1]
	end
	if p.life*5>255 then 
		p.fore.r=255
	else
		if data.image[p.y+p.x*data.h+1][2] <p.life*5 then
			p.fore.r=p.life*5
		else
			p.life=0
		end
	end
	p.life=p.life-1
end
function lib.particle_float(p,data,new_particles)

	if math.random()>0.75 then
		local nx=p.x+math.random(-1,1)
		local ny=p.y+math.random(-1,1)
		if not lib.is_in_wall(nx,ny,data) then
			p.x=nx
			p.y=ny
		else
			p.life=0
		end

	end
	p.life=p.life-1
end
function lib.particle_laser(p,data,new_particles)
		local nx=p.x+1
		
		if not lib.is_in_wall(nx,p.y,data) then
			p.x=nx
		else
			--table.insert(new_particles,{img=('*'):byte(),x=p.x,y=p.y,fore=lib.copyall(p.fore),back=lib.copyall(p.back),
			--	tick=lib.particle_float,life=math.random(50,100)})
			p.x=nx
			p.tick=lib.circuit_float
			p.img=data.image[p.y+nx*data.h+1][1]

		end
	p.life=p.life-1
end
--emmiters
return lib