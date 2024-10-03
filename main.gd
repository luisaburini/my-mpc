extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var button_colors = ["cyan", "magenta", "cyan", "red",
						 "red", "cyan", "red", "magenta",
						 "cyan", "magenta", "cyan", "red",
						 "red", "cyan", "red", "cyan"]
						
	for i in range(len(button_colors)):
		var mpc_button = get_node("MPCButton" + str(i+1))
		mpc_button.set_label("PAD " + str(i+1))
		mpc_button.set_normal_texture("res://imgs/button_" + button_colors[i] + ".jpg")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
