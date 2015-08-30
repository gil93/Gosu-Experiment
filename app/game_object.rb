# Extend Gosu::Image with our GameObject class
class GameObject < Gosu::Image 
	# Initialize GameObject with it's source image
	def initialize source
		@source = source	
	end
	#Override Gosu::Image#draw and set x, y and z params
	def draw x, y, z
		#Create our GameObject by passing our source image as a string
		@GameObject = Gosu::Image.from_text(self, @source, Gosu.default_font_name, 30)
		#Draw our image
		@GameObject.draw(x, y, z) 
	end
end