var minMove = -1000
var maxMove = 1000

varIsFinding = true

while varIsFinding {
	var move = irandom_range(-200,200)
	if y+move >= x+maxMove or y+move <= x+minMove {
	
	} else {
		y+=move
		varIsFinding = false
	}
}
