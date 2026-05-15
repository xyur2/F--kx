extends Node2D
class_name Customer

var personalities = ["Cower", "Bragger", "Mania", "Master"]
var shapes = []
var personality = personalities.pick_random()
var shape = shapes.pick_random()

func get_line1():
	var lines
	match personality:
		"Cower":
			lines = []
		"Bragger":
			lines = []
		"Mania":
			lines = []
		"Master":
			lines = []
	return lines.pick_random()

func get_line2():
	var lines
	var ret_var
	match personality:
		"Cower":
			lines = []
		"Bragger":
			lines = []
		"Mania":
			lines = []
		"Master":
			lines = []
	return lines.pick_random()

func get_line3():
	var lines
	var ret_var
	match personality:
		"Cower":
			lines = []
		"Bragger":
			lines = []
		"Mania":
			lines = []
		"Master":
			lines = []
	return lines.pick_random()
	
