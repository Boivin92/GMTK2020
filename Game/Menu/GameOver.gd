extends Control

func _ready():
	if Score.cargo_points_remaining > 0:
		$VBoxContainer/HBoxContainer/Value.text = str(Score.cargo_points_remaining) + "/" + str(Score.cargo_points_total)
	else:
		$VBoxContainer/Outcome.text = "Oh no! You lost all your cargo!"
		$VBoxContainer/BetterLuck.show()
		$VBoxContainer/HBoxContainer.hide()


func _on_Button_pressed():
	get_tree().change_scene("res://Game/Menu/MainMenu.tscn")
	pass # Replace with function body.
