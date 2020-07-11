extends RigidBody

class_name Crate

export (int) var cargo_value = 50

func _ready():
	Score.register_new_cargo(self)

func is_lost():
	Score.cargo_lost(self)
	queue_free()
