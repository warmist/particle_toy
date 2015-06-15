local engine=require 'particles'
local laser
function is_on_circuit(p,data)
	local from_img=data.walls[p.y+p.x*data.h+1]
	return engine.is_circuit(from_img)
end
function circuit(p,data,new_particles)
	local ok,dx,dy=engine.move_circuit(p,data,new_particles)
	if ok then
		if not is_on_circuit(p,data) then
			p.tick=laser
			p.dir=math.atan(dy,dx)+3.1416
			p.img=196
		else
			engine.overlay(p,data,new_particles)
		end
	end
end
laser=function(p,data,new_particles)
	if not engine.move_laser(p,data,new_particles) then
		p.x=p.x+1
		p.tick=circuit
	end
	engine.tick_rand_frame(p,data,new_particles)
end
local anims=engine.load_animated("frames.xp")
print("Animations loaded:",#anims)
local particles={
	a=function (self,data)
			if data.mouse.lbutton then 
				table.insert(data.particles,{x=self.x,y=self.y,life=80,img=196,fore=engine.copyall(self.fore),back={r=255,g=0,b=255},
					tick=laser,frames=anims[3],anim_fore=true,no_loop=true})
			end
		end
}
engine.run("Named1.xp",particles)