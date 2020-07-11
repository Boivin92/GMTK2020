extends Spatial

export(float) var vitesse := 10.0

enum State {
	Raised,
	Raising,
	Lowered,
	Lowering,
}
var state = State.Raised

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("activate"):
		match state:
			State.Raised:
				$AnimationPlayer.play("Activate")
			State.Lowered:
				$AnimationPlayer.play("Deactivate")
	
	if state == State.Raised:
		var move = Vector3()
		if Input.is_action_pressed("ui_left"):
			move.x -= vitesse
		if Input.is_action_pressed("ui_right"):
			move.x += vitesse
		if Input.is_action_pressed("ui_up"):
			move.z -= vitesse
		if Input.is_action_pressed("ui_down"):
			move.z += vitesse
		if move != Vector3.ZERO:
			translate(move * delta)

func set_state(s):
	state = s
