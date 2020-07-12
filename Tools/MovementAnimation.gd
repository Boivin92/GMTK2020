extends Spatial

var parent
const DIRECTION = Vector3(0,0,-1)
var speed = 6

func _ready():
	parent = get_parent()

func _physics_process(delta):
	parent.translate(DIRECTION * speed * delta)
	pass

func _on_Timer_timeout():
	parent.queue_free()
