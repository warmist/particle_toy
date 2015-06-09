local engine=require 'particles'
local particles={
	a=function (self,data)
			if data.mouse.lbutton then 
				table.insert(data.particles,{x=self.x,y=self.y,life=80,img=('-'):byte(),fore=engine.copyall(self.fore),back=engine.copyall(self.back),
					tick=engine.particle_laser})
			end
		end
}
engine.run("Named1.xp",particles)