extends Panel

var lClickHeld = false
var rClickHeld = false
var startOfSlash = Vector2(0,0)
var endOfSlash = Vector2(0,0)
var lcompleted = false
var rcompleted = false
var llines = []
var rlines = []
var inputs = []

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed == true:
				startOfSlash = get_local_mouse_position()
				rClickHeld = false
				lClickHeld = true
			else:
				if lClickHeld == true:
					lcompleted = true
					lClickHeld = false
					endOfSlash = get_local_mouse_position()
		elif event.button_index == 2:
			if event.pressed == true:
				startOfSlash = get_local_mouse_position()
				lClickHeld = false
				rClickHeld = true
			else:
				if rClickHeld == true:
					rcompleted = true
					rClickHeld = false
					endOfSlash = get_local_mouse_position()

func _ready():
	pass # Replace with function body.

func _process(delta):
	if (lcompleted == true):
		lcompleted = false
		llines.append([startOfSlash, endOfSlash, 30.0])
	if (rcompleted == true):
		rcompleted = false
		rlines.append([startOfSlash, endOfSlash, 30.0])
	update()

func _draw():
	#Player Input Processing
	if lClickHeld == true:
		draw_line(startOfSlash, get_local_mouse_position(), Color.white, 30.0)
		draw_circle(startOfSlash, 15.0,Color.white)
		draw_circle(get_local_mouse_position(), 15.0,Color.white)
	for line in llines.size():
		if llines[line][2] > 0:
			draw_line(llines[line][0],llines[line][1],Color.white,30.0/(31.0-llines[line][2]))
			draw_circle(llines[line][0],30.0/(31.0-llines[line][2])/2.0,Color.white)
			draw_circle(llines[line][1],30.0/(31.0-llines[line][2])/2.0,Color.white)
			llines[line][2] -= 1
			
	for line in range(llines.size(), 0, -1):
		if llines[line-1][2] <= 0:
			llines.remove(line-1)
	if rClickHeld == true:
		draw_line(startOfSlash, get_local_mouse_position(), Color.red, 30.0)
		draw_circle(startOfSlash, 15.0,Color.red)
		draw_circle(get_local_mouse_position(), 15.0,Color.red)
	for line in rlines.size():
		if rlines[line][2] > 0:
			draw_line(rlines[line][0],rlines[line][1],Color.red,30.0/(31.0-rlines[line][2]))
			draw_circle(rlines[line][0],30.0/(31.0-rlines[line][2])/2.0,Color.red)
			draw_circle(rlines[line][1],30.0/(31.0-rlines[line][2])/2.0,Color.red)
			rlines[line][2] -= 1
	for line in range(rlines.size(), 0, -1):
		if rlines[line-1][2] <= 0:
			rlines.remove(line-1)
	
	#Enemy Input Processing
	if get_node("EnemyControl").delay <= 0:
		inputs.append(get_node("EnemyControl").enemyInput + [50])
	for line in inputs.size():
		draw_line(inputs[line][0],inputs[line][1],Color.white,50/(51.0-inputs[line][2]))
		inputs[line][2] -= 1
		if inputs[line][2] <= 0:
			inputs.remove(line)
	
	
	
	
