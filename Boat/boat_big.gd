extends KinematicBody

export (float, 0, 20, 0.1) var roll_period = 1.0
export (float, 0, 10, 0.05) var roll_amplitude = 1.0
export (float, 0, 20, 0.1) var pitch_period = 1.0
export (float, 0, 10, 0.05) var pitch_amplitude = 1.0

var time_itself = 0
var wave_events := []

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	time_itself += delta
	# z is our forward/roll axis
	rotation.z = get_roll()
	# x is our sideways/pitch axis
	rotation.x = get_pitch()

func get_pitch() -> float:
	var base = get_wave_part(time_itself, roll_period, roll_amplitude)
	var from_events = 0
	for event in wave_events:
		var t = time_itself - event.when
		if t >= 0 and t < event.duration:
			from_events = get_wave_part(t, event.duration, cos(event.direction)*event.amplitude)
	# negate pitch value since the axis is left-handed
	return -(base + from_events)

func get_roll() -> float:
	var base = get_wave_part(time_itself, pitch_period, pitch_amplitude)
	var from_events = 0
	for event in wave_events:
		var t = time_itself - event.when
		if t >= 0 and t < event.duration:
			from_events += get_wave_part(t, event.duration, sin(event.direction)*event.amplitude)
	return base + from_events

func get_wave_part(time: float, period: float, amplitude: float) -> float:
	return sin( time * PI / period ) * amplitude / 10

func add_wave_event(duration: float, amplitude: float, direction: float) -> void:
	var event = {
		"when": time_itself,
		"duration": duration,
		"amplitude": amplitude,
		"direction": direction
	}
	wave_events.push_back(event)

func start_navigation():
	set_physics_process(true)

func stop_navigation():
	set_physics_process(false)
	time_itself = 0
	$Tween.remove_all()
	$Tween.interpolate_property(self, "rotation", self.rotation, Vector3(0,0,0), 2, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	$Tween.start()
