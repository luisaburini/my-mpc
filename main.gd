extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var button_colors = ["cyan", "magenta", "cyan", "red",
						 "red", "cyan", "red", "magenta",
						 "cyan", "magenta", "cyan", "red",
						 "red", "cyan", "red", "cyan"]
	var keys = ["X", "C", "V", "B",
				"S", "D", "F", "G",	
				"W", "E", "R", "T",
				"2", "3", "4", "5"]
						
	for i in range(len(button_colors)):
		var mpc_button = get_node("MPCButton" + str(i+1))
		mpc_button.set_label("PAD " + str(i+1))
		mpc_button.set_normal_texture("res://imgs/button_" + button_colors[i] + ".jpg")
		mpc_button.set_key(keys[i])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var selected = $OptionButton.selected
	if selected >= 0 and selected <= 15:
		var id = "MPCButton" + str(selected+1)
		print(id)
		var n = get_node(id)
		n.remove_sound()
