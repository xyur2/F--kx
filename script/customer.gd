extends Node2D
class_name Customer

var personalities = ["Cower", "Bragger", "Mania", "Master"]
#var shapes = []
var personality = personalities.pick_random()
#var shape = shapes.pick_random()

func get_line1():
	var lines
	match personality:
		"Cower":
			lines = [
				"Cower 대사 1-1",
				"Cower 대사 1-2",
				"Cower 대사 1-2"
			]
		"Bragger":
			lines = [
				"Bragger 대사 1-1",
				"Bragger 대사 1-2",
				"Bragger 대사 1-3"
			]
		"Mania":
			lines = [
				"Mania 대사 1-1",
				"Mania 대사 1-2",
				"Mania 대사 1-3"
			]
		"Master":
			lines = [
				"Master 대사 1-1",
				"Master 대사 1-2",
				"Master 대사 1-3"
			]
	return lines.pick_random()

func get_line2():
	var lines
	match personality:
		"Cower":
			lines = [
				"Cower 대사 2-1",
				"Cower 대사 2-2",
				"Cower 대사 2-2"
			]
		"Bragger":
			lines = [
				"Bragger 대사 2-1",
				"Bragger 대사 2-2",
				"Bragger 대사 2-3"
			]
		"Mania":
			lines = [
				"Mania 대사 2-1",
				"Mania 대사 2-2",
				"Mania 대사 2-3"
			]
		"Master":
			lines = [
				"Master 대사 2-1",
				"Master 대사 2-2",
				"Master 대사 2-3"
			]
	return lines.pick_random()

func get_line3():
	var lines
	match personality:
		"Cower":
			lines = [
				"Cower 대사 3-1",
				"Cower 대사 3-2",
				"Cower 대사 3-2"
			]
		"Bragger":
			lines = [
				"Bragger 대사 3-1",
				"Bragger 대사 3-2",
				"Bragger 대사 3-3"
			]
		"Mania":
			lines = [
				"Mania 대사 3-1",
				"Mania 대사 3-2",
				"Mania 대사 3-3"
			]
		"Master":
			lines = [
				"Master 대사 1-1",
				"Master 대사 1-2",
				"Master 대사 1-3"
			]
	return lines.pick_random()
	
