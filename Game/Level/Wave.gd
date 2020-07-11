extends MeshInstance


export(float) var speed = 15
var starting_position

# Called when the node enters the scene tree for the first time.
func _ready():
	starting_position = self.transform
	pass # Replace with function body.

func _physics_process(delta):
	self.translate(Vector3(0,0,-1) * speed * delta)


func _on_Timer_timeout():
	self.transform = starting_position
	
	pass # Replace with function body.
