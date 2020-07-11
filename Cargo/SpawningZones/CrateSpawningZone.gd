extends Spatial

export(Array, PackedScene) var spawning_zones = []

func _ready():
	if spawning_zones.size() > 0:
		randomize()
		spawning_zones.shuffle()
		var zone_instance = spawning_zones[0].instance()
		zone_instance.transform = self.transform
		zone_instance.rotation.y += (randi() % 4) * 90
		get_parent().call_deferred("add_child", zone_instance)
		self.queue_free()
