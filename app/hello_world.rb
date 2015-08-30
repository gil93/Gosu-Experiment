# Extend Gosu::Window with the GameWindow class
class GameWindow < Gosu::Window 
	#Initialize as 320px by 240px window
	def initialize width=320, height=240, fulscreen=false 
		#Super passes params from GameWindow to Gosu::Window
		super 
		#Window title caption
		self.caption = 'Hello'
		#Display 'Hello World!' message
		#Call Gosu::Image.from_text(window, text, font_name, font_height)
		@message = Gosu::Image.from_text(self, 'Hello World!', Gosu.default_font_name, 30)
	end
	#Override Gosu::Window#draw instance method 
	#Call draw(x, y, z) on @message and set values
	def draw
		@message.draw(10, 10, 0)
	end
end