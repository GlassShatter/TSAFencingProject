extends Node2D
class_name AttackLine

# Declare member variables here. Examples:
var lineWidth = 30
var lineDuration = 100
var start = Vector2(0, 300)
var end = Vector2(1000, 300)
var time

func _init(param_start = Vector2(0,200), param_end = Vector2(1000,200)):
	self.start = param_start
	self.end = param_end
	self.time = lineDuration
	print("made a line")

func _ready():
	pass

func _process(delta):
	if (time > 0):
		time -= 1
		print(time)
	else:
		queue_free()
	update()

func _draw():
	draw_line(start, end, Color.gray, lineWidth/((lineDuration+1.0)-time))
	draw_circle(start, lineWidth/((lineDuration+1.0)-time)/2.0, Color.gray)
	draw_circle(end, lineWidth/((lineDuration+1.0)-time)/2.0, Color.gray)
