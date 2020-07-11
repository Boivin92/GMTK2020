tool
class_name Crate, "res://Cargo/crate.svg"

extends RigidBody

var resources = "res://Cargo/"
var CRATEMESH = "CrateMesh.tres"
var BOXSHAPE = "BoxShape.tres"

var mat_type_private
var size_private
export(String, "wood", "metal") var material_type setget set_mat, get_mat
export(String, "small", "large") var size setget set_size, get_size

func _ready():
	$MeshInstance.material_override = load(resources + material_type + ".tres")
	$MeshInstance.mesh = load(resources + size + CRATEMESH)
	$CollisionShape.shape = load(resources + size + BOXSHAPE)
	if material_type == "metal":
		collision_layer = 2
	else:
		collision_layer = 1

func set_mat(value):
	if $MeshInstance:
		$MeshInstance.material_override = load(resources + value + ".tres")
	mat_type_private = value
	if mat_type_private == "metal":
		collision_layer = 2
	else:
		collision_layer = 1

func get_mat():
	return mat_type_private

func set_size(value):
	if $MeshInstance:
		$MeshInstance.mesh = load(resources + value + CRATEMESH)
	if $CollisionShape:
		$CollisionShape.shape = load(resources + value + BOXSHAPE)
	size_private = value

func get_size():
	return size_private
