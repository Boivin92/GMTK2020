extends Control

var game = preload("res://Game/Level/Level.tscn")

func _ready():
	$VBoxContainer/CheckBox.pressed = PlayerInfos.show_tutorials

func _on_StartGame_pressed():
	get_tree().change_scene_to(game)
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_CheckBox_toggled(button_pressed):
	PlayerInfos.show_tutorials = button_pressed
	pass # Replace with function body.
