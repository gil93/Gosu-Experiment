class GameObject < Gosu::Image 

	attr_accessor :source, :window, :x, :y, :z, :angle, :scale_x, :scale_y, :object
	attr_reader :source, :window, :x, :y, :z, :angle,  :scale_x, :scale_y, :object

	def initialize source, window, x, y, z, angle, scale_x, scale_y
		self.source = source
		self.window = window  
		self.x = x 
		self.y = y
		self.z = z 
		self.angle = angle
		self.scale_x = scale_x
		self.scale_y = scale_y
	end

	def draw source, x, y, z, angle, scale_x, scale_y
		self.object = Gosu::Image.from_text self.window, source, Gosu.default_font_name, 60
		self.object.draw_rot x, y, z, angle, 0.5, 0.5, scale_x, scale_y	
	end
end

# Note: The gameobjects features are subject to change by making them
# parameters that can be passed in the GameWindow class. They can each 
# be altered and returned (set and get). source = source image (in this case a string),
# x, y = location on the screen, z = which layer the image is on, angle, can be used
# to rotate the image, scale_x and scale_y can be used to flip the image on
# it's vertical and horizontal axis.