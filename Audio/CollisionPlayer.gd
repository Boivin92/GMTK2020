extends Node

func play_random(collision : Array, type : String):
	if CollisionSoundServer.register_collision(collision[0], collision[1]):
		match type:
			"WoodOnWood":
				$WoodOnWood.play_random()
			"MetalOnMetal":
				$MetalOnMetal.play_random()
			"MetalOnWood":
				$MetalOnWood.play_random()
