require 'firebase'

base_uri = 'https://blazing-torch-2656.firebaseio.com/'
firebase = Firebase::Client.new(base_uri)

res = firebase.get 'shapes'

shapes = res.body

def random_hsl_color
	s = (rand * 100).to_i
	l = (rand * 100).to_i
	"hsl(0, #{s}%, #{l}%)"
end

# Randomly change colours for all shapes
shapes.each { |key,shape|
	puts "Modifying colour of #{shape['type']} '#{shape['title']}'"

	firebase.update "shapes/#{key}", { colour: random_hsl_color }
}


# Turn shape into triangle and triangle into shape
shapes.each { |key,shape| 
	puts "Changing type of '#{shape['title']}'"

	firebase.update "shapes/#{key}", { type: (shape['type'] === 'square') ? 'triangle' : 'square' }
}
