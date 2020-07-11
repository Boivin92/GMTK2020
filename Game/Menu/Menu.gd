extends Control

var game = preload("res://Game/Level/Level.tscn")

func _on_StartGame_pressed():
	get_tree().change_scene_to(game)
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
