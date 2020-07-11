extends Spatial

enum State {
	Raised,
	Raising,
	Lowered,
	Lowering,
}
export (State) var state = State.Raised

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("activate"):
		match state:
			State.Raised:
				$AnimationPlayer.play("Activate")
			State.Lowered:
				$AnimationPlayer.play("Deactivate")
