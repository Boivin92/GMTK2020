extends Spatial

export(float) var vitesse := 10.0
export(float) var max_x := 10
export(float) var max_z := 10
export(float) var puissance := 9.8
export(float) var vitesse_down_up := 1.0

enum ControlType {
	Keyboard,
	Follow,
	PointAndClick,
}
export (ControlType) var control_type := ControlType.Keyboard
export (NodePath) var camera

enum State {
	Raised,
	Raising,
	Lowered,
	Lowering,
}
var state = State.Raised

func _ready() -> void:
	$Effet.gravity = puissance
	if control_type != ControlType.Keyboard:
		camera = get_node(camera)

func _process(delta: float) -> void:
	var move = Vector3.ZERO
	match control_type:
		ControlType.Keyboard:
			move = process_keyboard()
		ControlType.Follow:
			move = process_follow()
		ControlType.PointAndClick:
			move = process_point_click()
	if move:
		translate(move * delta)
		translation.x = clamp(translation.x, -max_x, max_x)
		translation.z = clamp(translation.z, -max_z, max_z)

func process_keyboard() -> Vector3:
	if Input.is_action_just_pressed("activate"):
		match state:
			State.Raised:
				$AnimationPlayer.play("Activate", -1, vitesse_down_up)
			State.Lowered:
				$AnimationPlayer.play("Deactivate", -1, vitesse_down_up)
	
	if true: #state == State.Raised:
		var move = Vector3()
		if Input.is_action_pressed("ui_left"):
			move.x += vitesse
		if Input.is_action_pressed("ui_right"):
			move.x -= vitesse
		if Input.is_action_pressed("ui_up"):
			move.z += vitesse
		if Input.is_action_pressed("ui_down"):
			move.z -= vitesse
		return move
	return Vector3.ZERO

func process_follow() -> Vector3:
	if Input.is_action_pressed("activate") and state == State.Raised:
		$AnimationPlayer.play("Activate")
	elif not Input.is_action_pressed("activate") and state == State.Lowered:
		$AnimationPlayer.play("Deactivate")
	elif state == State.Raised:
		var mouse_pos = mouse_world_position()
		if mouse_pos and mouse_pos.length_squared() > 0.1:
			return mouse_pos.normalized() * vitesse
	return Vector3.ZERO

func process_point_click() -> Vector3:
	return Vector3.ZERO

func mouse_world_position() -> Vector3:
	var pont = Plane(Vector3(0, 1, 0), translation.y)
	var p2d = get_viewport().get_mouse_position()
	var p3d = pont.intersects_ray(camera.project_ray_origin(p2d), camera.project_ray_normal(p2d))
	return p3d - translation if p3d else Vector3.ZERO

func set_state(s):
	state = s
