extends Node2D
class_name AttackLine

# Declare member variables here. Examples:
var lineWidth = 30
var lineDuration = 30
var start = Vector2(0, 500)
var end = Vector2(1000, 500)

func _init(var start, var end):
	self.start = start
	self.end = end

func _ready():
	pass

func _process(delta):
	if (lineWidth > 0):
		lineWidth -= 1
	else:
		queue_free()
	update()

func _draw():
	draw_line(start, end, Color.gray, lineWidth)
	draw_circle(start, lineWidth/2.0, Color.gray)
	draw_circle(end, lineWidth/2.0, Color.gray)
