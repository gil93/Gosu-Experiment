class GameWindow < Gosu::Window 

	# Setters and getters for our gameobject
	attr_accessor :text, :x, :y, :z, :angle, :draws, :buttons_down
	attr_reader :text, :x, :y, :z, :angle, :draws, :buttons_down

	#-v---[Constructor]---v-

	def initialize width = 1024, height = 768, fullscreen = true
		super 
		self.text = ">"
		self.x = 200
		self.y = 200
		self.z = 1
		self.angle = 0.0
		self.draws = 0
		self.buttons_down = 0	
		# Set the gameobject's setters and getters to their default values
		@obj = GameObject.new(self.text, self, self.x, self.y, self.z, self.angle, 1.0, 1.0)
	end

	#-v---[Callbacks]---v-

		#-v--[Update Callbacks]--v-

	def update 
		# Update movement and corresponding 'animations' in the main loop
		update_location
		update_direction
	end

	def draw
		# Draw the image with updated values
		self.draws += 1	
		@obj.draw @obj.source, @obj.x, @obj.y, @obj.z, @obj.angle, @obj.scale_x, @obj.scale_y
	end

	def needs_redraw? 
		draws == 0 || self.buttons_down > 0
	end

		#-v--[Input Callbacks]--v-

	# Only apply updates when keys that can change the gameobject
	# are pressed and released 
	def button_down id 
		close if id == Gosu::KbEscape
		self.buttons_down += 1 if acceptable_input.include? id
	end

	def button_up id 
		self.buttons_down -= 1 if acceptable_input.include? id
	end

	#-v---[Methods]---v-

		#-v--[Input Methods]--v-

	def acceptable_input 
		input = [Gosu::KbLeft, Gosu::KbRight, Gosu::KbUp, Gosu::KbDown]
	end

		#-v--[Update Methods]--v-

	def update_location 
		@obj.x -= 5 if button_down? Gosu::KbLeft
	    @obj.x += 5 if button_down? Gosu::KbRight
	    @obj.y -= 5 if button_down? Gosu::KbUp
	    @obj.y += 5 if button_down? Gosu::KbDown
	end

	def update_direction 
		left if button_down? Gosu::KbLeft
		right if button_down? Gosu::KbRight
		up if button_down?(Gosu::KbUp)
		down if button_down?(Gosu::KbDown)
	end

	# Apply changes to the gameobject's source image in accordance to
	# current movement to emulate direction

	def left 
		# @obj.scale_x = -1.0 
		@obj.source = "<"
	end

	def right 
		# @obj.scale_x = 1.0
		@obj.source = ">" 
	end

	def up
		# @obj.scale_y = 1.0
		@obj.source = "^"
	end

	def down
		# @obj.scale_y = -1.0
		@obj.source = "v"
	end
end

