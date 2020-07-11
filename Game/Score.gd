extends Node

var cargo_points_remaining = 0
var cargo_points_total = 0

func new_game():
	cargo_points_remaining = 0
	cargo_points_total = 0

func register_new_cargo(cargo):
	cargo_points_total += cargo.cargo_value
	cargo_points_remaining += cargo.cargo_value

func cargo_lost(cargo):
	cargo_points_remaining -= cargo.cargo_value
