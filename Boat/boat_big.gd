extends StaticBody

var time_itself = 0

func _physics_process(delta):
	time_itself+=delta
	self.rotation.z = sin(time_itself/5)/5
	self.rotation.x = cos(time_itself/5)/5
