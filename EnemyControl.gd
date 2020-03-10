extends Control


var enemyInput
var delay = 100
var rand_generate = RandomNumberGenerator.new()

func _ready():
	rand_generate.randomize()


func _process(delta):
	delay -= 1
	if delay == 0:
		var startPos = Vector2(rand_generate.randi_range(0,1000),rand_generate.randi_range(0,1000))
		var endPos  = Vector2(rand_generate.randi_range(0,1000),rand_generate.randi_range(0,1000))
		enemyInput = [startPos,endPos]
	elif delay < 0:
		delay = 70
	pass
