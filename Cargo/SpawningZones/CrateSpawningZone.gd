extends Spatial

export(Array, PackedScene) var spawning_zones = []

func _physics_process(delta):
	can_spawn()

func can_spawn():
	$VisualIndicatorOK.show()
	$VisualIndicatorWRONG.hide()
	for body in $Area.get_overlapping_bodies():
		if body.is_in_group("crate"):
			$VisualIndicatorOK.hide()
			$VisualIndicatorWRONG.show()

func spawn():
	if spawning_zones.size() > 0:
		randomize()
		spawning_zones.shuffle()
		var zone_instance = spawning_zones[0].instance()
		zone_instance.transform = self.transform
		zone_instance.rotation.y += (randi() % 4) * 90
		get_parent().call_deferred("add_child", zone_instance)
		self.queue_free()

func start_navigation():
	spawn()
