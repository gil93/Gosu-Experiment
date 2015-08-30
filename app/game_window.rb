# Extend Gosu::Window with our GameWindow class
class GameWindow < Gosu::Window 
	# Initialize as 1024px by 768px window with fullscreen
	def initialize width=1024, height=768, fulscreen=true
		# Super passes params from GameWindow to Gosu::Window
		super 
		# Set window caption to 'Movement!'
		self.caption = 'Movement!'
		# Declare x and y coordinates for our object
		@x = 0
		@y = 0
		# Declare redraw bool, for redrawing our objects 
		# during an update tick
		@draws = 0
		# Declare button bool, for calling an update tick
		# upon button press 
		@buttons_down = 0
	end
	# Override Gosu::Window#update instance method
	def update 
		# Update the object's x and y coordinates on the 
		# screen during each update tick
		@x -= 3 if button_down?(Gosu::KbLeft)	
		@x += 3 if button_down?(Gosu::KbRight)
		@y -= 3 if button_down?(Gosu::KbUp)
		@y += 3 if button_down?(Gosu::KbDown)
	end 
	# Override Gosu::Window#draw instance method 
	def draw
		# Count each time the object is redrawn
		@draws += 1
		# Draw our GameObject by instantiating a GameObject
		# an passing our String as it's Source
		@GameObject = GameObject.new("GameObject, x: #{@x}, y: #{@y}, draws: #{@draws}")
		# Call our GameObject's draw method and pass our values
		@GameObject.draw(@x, @y, 0)
	end
	# Override Gosu::Window#redraw instance method
	def needs_redraw?
		# Only redraw the object after an update tick
		# if there are no objects to display, and there
		# are no buttons pressed
		@draws == 0 || @buttons_down > 0
	end
	# Override Gosu::Window#button_down method
	# Takes a pressed key as a param
	def button_down id 
		# A button has been pressed if that button matches our approved buttons
		@buttons_down += 1 if id == Gosu::KbUp || id == Gosu::KbDown || id == Gosu::KbRight || id == Gosu::KbLeft 
		# Close loop if ESC is pressed
		close if id == Gosu::KbEscape
	end
	# Override Gosu::Window#button_up method
	# Takes pressed key as a param
	def button_up id 
		# A button has been released if that button matches our approved buttons
		@buttons_down -= 1 if id == Gosu::KbUp || id == Gosu::KbDown || id == Gosu::KbRight || id == Gosu::KbLeft
	end
end