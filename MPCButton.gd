extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_label(text):
	$Label.text = text
	
func set_normal_texture(icon):
	$TouchScreenButton.texture_normal = load(icon)
	
func _on_touch_screen_button_pressed():
	print("TOUCH MPC BUTTON")
	$FileDialog.show()


func _on_touch_screen_button_released():
	print("Released mpc button")


func _on_touch_screen_button_button_up():
	print("Released mpc button")
