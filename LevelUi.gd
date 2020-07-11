extends Control

func _process(delta):
	update_remaining_cargo()
	update_total_cargo()

func update_remaining_cargo():
	$VBoxContainer/Remaining.text = "Remaining: " + str(Score.cargo_points_remaining)

func update_total_cargo():
	$VBoxContainer/Total.text = "Total cargo: " + str(Score.cargo_points_total)

func update_time_remaining(time_left : float):
	var seconds = int(time_left)
	var minutes = int(seconds / 60)
	seconds = seconds % 60
	$VBoxContainer2/TimeRemaining.text = format_to_double_digits(minutes) + ":" + format_to_double_digits(seconds)

func format_to_double_digits(value):
	if value < 10:
		return "0" + str(value)
	else:
		return str(value)
