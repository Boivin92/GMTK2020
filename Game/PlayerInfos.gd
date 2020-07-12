extends Node

var show_tutorials : bool setget set_showtuts, get_showtuts

const SAVEFILE = "user://PlayerInfos.json"
var save_data = {}

func _ready():
	load_infos()
	pass

func load_infos():
	var file = File.new()
	if not file.file_exists(SAVEFILE):
		save_data = {"show_tutorials" : true}
		save_infos()
		pass
	file.open(SAVEFILE, File.READ)
	var content = file.get_as_text()
	var data = parse_json(content)
	save_data = data
	file.close()
	show_tutorials = save_data.show_tutorials
	pass

func save_infos():
	var save_game = File.new()
	save_game.open(SAVEFILE, File.WRITE)
	save_game.store_line(to_json(save_data))

func get_showtuts():
	return save_data.show_tutorials

func set_showtuts(value):
	save_data.show_tutorials = value
	save_infos()
