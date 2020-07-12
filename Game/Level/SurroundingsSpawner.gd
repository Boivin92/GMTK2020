extends Spatial

export (Array, PackedScene) var spawnableObjects = []
export (PackedScene) var movement_animator

func _ready():
	randomize()
	$Timer.wait_time = rand_range(2,10)

func spawn():
	spawnableObjects.shuffle()
	var obj = spawnableObjects[0].instance()
	obj.add_child(movement_animator.instance())
	add_child(obj)

func start_navigation():
	$Timer.start()

func stop_navigation():
	$Timer.stop()


func _on_Timer_timeout():
	spawn()
	$Timer.wait_time = rand_range(3,12)
	$Timer.start()
