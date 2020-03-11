extends Panel

var AttackLine = load("res://AttackLine.gd")
var BlockLine = load("res://BlockLine.gd")
var lClickHeld = false
var rClickHeld = false
var startOfSlash = Vector2(0,0)
var endOfSlash = Vector2(0,0)
var lcompleted = false
var rcompleted = false
var llines = []
var rlines = []
var inputs = []
var enemySwipes = []

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
	pass

func _process(delta):
	if (lcompleted == true):
		lcompleted = false
		var newLine = AttackLine.new(startOfSlash,endOfSlash,30)
		add_child(newLine)
	if (rcompleted == true):
		rcompleted = false
		var newLine = AttackLine.new(startOfSlash,endOfSlash,30)
		add_child(newLine)
	update()

func _draw():
	#Player Input Processing
	if lClickHeld == true:
		draw_line(startOfSlash, get_local_mouse_position(), Color.white, 30.0)
		draw_circle(startOfSlash, 15.0,Color.white)
		draw_circle(get_local_mouse_position(), 15.0,Color.white)
	if rClickHeld == true:
		draw_line(startOfSlash, get_local_mouse_position(), Color.lightgray, 30.0)
		draw_circle(startOfSlash, 15.0,Color.lightgray)
		draw_circle(get_local_mouse_position(), 15.0,Color.lightgray)
	
	#Enemy Input Processing
	if get_node("EnemyControl").delay <= 0:
		inputs.append(get_node("EnemyControl").enemyInput + [50])
		var newRect = Rect2(Vector2(0,0),Vector2(10,10))
		newRect.position = inputs[-1][0]
		newRect.end = inputs[-1][1]
		
		#enemySwipes.append(Rect2(inputs[-1][0]),Vector2(10,10))
		#enemySwipes[-1].end = inputs[-1][1]
	for line in inputs.size():
		draw_line(inputs[line][0],inputs[line][1],Color.red,50/(51.0-inputs[line][2]))
		inputs[line][2] -= 1
		if inputs[line][2] <= 0:
			inputs.remove(line)
	
	
	
	
