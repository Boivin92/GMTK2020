extends StaticBody

var time_itself = 0

func _physics_process(delta):
	time_itself+=delta
	self.rotation.z = sin(time_itself/5)/5
	self.rotation.x = -sin(time_itself/7)/8
	if time_itself < 1:
		print("x: " + str(self.rotation_degrees.x))
		print("z: " + str(self.rotation_degrees.z))
