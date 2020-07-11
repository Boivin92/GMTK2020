extends KinematicBody

export (float, 0, 20, 0.1) var roll_period = 1.0
export (float, 0, 1, 0.05) var roll_amplitude = 1.0
export (float, 0, 20, 0.1) var pitch_period = 1.0
export (float, 0, 1, 0.05) var pitch_amplitude = 1.0

var time_itself = 0

func _physics_process(delta):
	time_itself += delta
	rotation.z = get_pitch()
	rotation.x = get_roll()

func get_roll() -> float:
	var base = -sin( time_itself * PI / roll_period ) * roll_amplitude / 10
	return base

func get_pitch() -> float:
	var base = sin( time_itself * PI / pitch_period ) * pitch_amplitude / 10
	return base
