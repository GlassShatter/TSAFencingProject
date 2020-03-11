extends Node2D

var lineWidth = 30
var lineDuration = 30
var start
var end
var time
var lineColor = Color.gray
var collisionRect

func _init(param_start, param_end, lineDuration):
	self.start = param_start
	self.end = param_end
	self.time = lineDuration
	sizes = param_end-param_start
	var lineLength = sqrt((sizes.x*sizes.x)+(sizes.y*sizes.y))
	collisionRect = Rect2(self.start,)

func _process(delta):
	if (self.time > 0):
		self.time -= 1
		print(str(time))
	else:
		queue_free()
	update()

func _draw():
	draw_line(start, end, lineColor, lineDuration/((lineWidth+1.0)-time))
	draw_circle(start, lineDuration/((lineWidth+1.0)-time)/2.0, lineColor)
	draw_circle(end, lineDuration/((lineWidth+1.0)-time)/2.0, lineColor)
