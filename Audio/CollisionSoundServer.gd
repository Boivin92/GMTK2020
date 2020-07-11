extends Node

var last_frame_collisions = []

func register_collision(body1, body2):
	if last_frame_collisions.has([body1,body2]) or last_frame_collisions.has([body2,body1]):
		return false
	else:
		last_frame_collisions.append([body1,body2])
		return true

func _physics_process(delta):
	last_frame_collisions.clear()
