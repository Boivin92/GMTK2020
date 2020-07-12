extends Spatial

var spawn_zone = preload("res://Cargo/SpawningZones/CrateSpawningZone.tscn")

var navigating = false
var number_of_spawn_crates = 3

func _ready():
	randomize()
	Score.new_game()
	create_spawns(number_of_spawn_crates)

func create_spawns(number):
	var positions = $Crates.get_children()
	for i in number:
		positions.shuffle()
		var pos = positions.pop_front()
		var new_zone = spawn_zone.instance()
		new_zone.transform = pos.transform
		$SpawnContainer.add_child(new_zone)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Game/Menu/MainMenu.tscn")
	$LevelUi.update_time_remaining($Timer.time_left)
	
	if not navigating && Input.is_action_just_pressed("ui_accept"):
		get_tree().call_group("game", "start_navigation")
		
	if navigating && Score.cargo_points_remaining == 0:
		game_over()


func _on_Timer_timeout():
	navigating = false
	get_tree().call_group("game", "stop_navigation")

func game_over():
	get_tree().change_scene("res://Game/Menu/GameOver.tscn")

func start_navigation():
	$Timer.start()
	$AnimationPlayer.play("Wave events 2")
	navigating = true
	
func stop_navigation():
	number_of_spawn_crates += 1
	if number_of_spawn_crates == 6:
		get_tree().change_scene("res://Game/Menu/GameOver.tscn")
	create_spawns(number_of_spawn_crates)
	$AnimationPlayer.stop()
	navigating = false
