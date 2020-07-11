extends Spatial

func _ready():
	Score.new_game()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Game/Menu/MainMenu.tscn")
