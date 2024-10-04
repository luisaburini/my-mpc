extends Node2D

var current_sound = ""
var function = 0
const SILENT = 0
const ONE_TIME = 1
const LOOP = 2
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
	if current_sound == "":
		$FileDialog.show()


func remove_sound():
	$AudioStreamPlayer2D.stop()
	current_sound = ""
	$Filename.text = ""

func _on_file_dialog_file_selected(path):
	current_sound =  path
	print("Selected " + current_sound) 
	var filename_arr = current_sound.rsplit("/", true, 1)
	$Filename.text = filename_arr[1]
	var snd_file = FileAccess.open(current_sound, FileAccess.READ)
	var stream = AudioStreamMP3.new()
	stream.data = snd_file.get_file_as_bytes(current_sound)
	snd_file.close()
	$AudioStreamPlayer2D.stream = stream


func _on_audio_stream_player_2d_finished():
	if function == LOOP:
		$AudioStreamPlayer2D.play()


func _on_touch_screen_button_button_down():
	if current_sound != "":
		function = (function+1)%3
		match function:
			LOOP:
				$AudioStreamPlayer2D.play()		
				$State.text = "LOOP"
			ONE_TIME:
				$AudioStreamPlayer2D.play()
				$State.text = "1"
			SILENT:
				$AudioStreamPlayer2D.stop()
				$State.text = ""
