extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	update_remaining_cargo()
	update_total_cargo()

func update_remaining_cargo():
	$VBoxContainer/Remaining.text = "Remaining: " + str(Score.cargo_points_remaining)

func update_total_cargo():
	$VBoxContainer/Total.text = "Total cargo: " + str(Score.cargo_points_total)
