extends StaticBody

var time_itself = 0
export (float) var z_axis_dampening = 5
export (float) var z_axis_speed = 5
export (float) var x_axis_dampening = 7
export (float) var x_axis_speed = 8


func _physics_process(delta):
	time_itself+=delta
	self.rotation.z = sin(time_itself/z_axis_dampening)/z_axis_speed
	self.rotation.x = -sin(time_itself/x_axis_dampening)/x_axis_speed
