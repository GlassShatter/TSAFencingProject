extends Node2D

var lineWidth = 30
var lineDuration = 30
var start = Vector2(100, 300)
var end = Vector2(1000, 300)
var time

func _init(param_start, param_end, lineDuration):
	self.start = param_start
	self.end = param_end
	self.time = lineDuration
	print("made a line")

func _process(delta):
	if (self.time > 0):
		self.time -= 1
		print(str(time))
	else:
		print('im free')
		queue_free()
	update()

func _draw():
	draw_line(start, end, Color.gray, lineDuration/((lineWidth+1.0)-time))
	draw_circle(start, lineDuration/((lineWidth+1.0)-time)/2.0, Color.gray)
	draw_circle(end, lineDuration/((lineWidth+1.0)-time)/2.0, Color.gray)
