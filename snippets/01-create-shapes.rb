require 'firebase'

base_uri = 'https://blazing-torch-2656.firebaseio.com/'
firebase = Firebase::Client.new(base_uri)

# Get rid of all existing shapes
firebase.delete 'shapes'

# Create new shapes
firebase.push 'shapes', { title: 'Magic square', type: 'square', timestamp: 1, colour: "hsl(0, 11%, 52%)" }
firebase.push 'shapes', { title: 'Voodoo square', type: 'square', timestamp: 1, colour: "hsl(0, 21%, 42%)" }
firebase.push 'shapes', { title: 'Oblivious square', type: 'square', timestamp: 1, colour: "hsl(0, 31%, 32%)" }
firebase.push 'shapes', { title: 'Magic triangle', type: 'triangle', timestamp: 1, colour: "hsl(0, 41%, 22%)" }
firebase.push 'shapes', { title: 'Special triangle', type: 'triangle', timestamp: 1, colour: "hsl(0, 51%, 12%)" }
