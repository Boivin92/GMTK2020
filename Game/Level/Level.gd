extends Spatial

func _ready():
	Score.new_game()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Game/Menu/MainMenu.tscn")
	$LevelUi.update_time_remaining($Timer.time_left)
	if Score.cargo_points_remaining == 0:
		game_over()


func _on_Timer_timeout():
	get_tree().change_scene("res://Game/Menu/GameOver.tscn")

func game_over():
	get_tree().change_scene("res://Game/Menu/GameOver.tscn")
