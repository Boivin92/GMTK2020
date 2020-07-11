extends RigidBody

class_name Crate

export (int) var cargo_value = 50

func _ready():
	Score.register_new_cargo(self)

func is_lost():
	Score.cargo_lost(self)
	if not $SplouchePlayer.playing:
		$SplouchePlayer.play_random()

func _on_SplouchePlayer_finished():
	queue_free()


func _on_Box_body_entered(body):
	if body.is_in_group("crate"):
		if self.linear_velocity.length() > 0.5:
			if body.is_in_group("wood") && self.is_in_group("wood"):
				$CollisionPlayer.play_random([self,body], "WoodOnWood")
			elif body.is_in_group("metal") && self.is_in_group("metal"):
				$CollisionPlayer.play_random([self,body], "MetalOnMetal")
			else:
				$CollisionPlayer.play_random([self,body], "MetalOnWood")
	pass # Replace with function body.
