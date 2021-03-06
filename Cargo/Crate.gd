extends RigidBody

class_name Crate

export (int) var cargo_value = 50
var lost = false

func _ready():
	Score.register_new_cargo(self)

func is_lost():
	if not lost:
		Score.cargo_lost(self)
		lost = true
	if not $SplouchePlayer.playing:
		$SplouchePlayer.play_random()

func _on_SplouchePlayer_finished():
	if $FloatTimer.is_stopped():
		$FloatTimer.start()


func _on_Box_body_entered(body):
	if body.is_in_group("crate") && not lost:
		if self.linear_velocity.length() > 1:
			if body.is_in_group("wood") && self.is_in_group("wood"):
				$CollisionPlayer.play_random([self,body], "WoodOnWood")
			elif body.is_in_group("metal") && self.is_in_group("metal"):
				$CollisionPlayer.play_random([self,body], "MetalOnMetal")
			else:
				$CollisionPlayer.play_random([self,body], "MetalOnWood")


func _on_FloatTimer_timeout():
	collision_mask = 0
	collision_layer = 0
	$FallTimer.start()


func _on_FallTimer_timeout():
	queue_free()
