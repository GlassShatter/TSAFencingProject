extends Control

# Declare member variables here. Examples:
var CoordLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	CoordLabel = get_node("CoordsLabel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	CoordLabel.set_text(String(get_global_mouse_position()))
