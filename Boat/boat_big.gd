extends KinematicBody

export (float, 0, 20, 0.1) var roll_period = 1.0
export (float, 0, 10, 0.05) var roll_amplitude = 1.0
export (float, 0, 20, 0.1) var pitch_period = 1.0
export (float, 0, 10, 0.05) var pitch_amplitude = 1.0

var time_itself = 0
var wave_events := []

func _physics_process(delta):
	time_itself += delta
	rotate_z(get_pitch() - rotation.z)
	rotate_x(get_roll() - rotation.x)

func get_roll() -> float:
	var base = -get_wave_part(time_itself, roll_period, roll_amplitude)
	return base

func get_pitch() -> float:
	var base = get_wave_part(time_itself, pitch_period, pitch_amplitude)
	return base

func get_wave_part(time: float, period: float, amplitude: float) -> float:
	return sin( time * PI / period ) * amplitude / 10

func add_wave_event(duration: float, amplitude: float, direction: float) -> void:
	pass
