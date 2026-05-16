extends Node

class_name joke

var joke_num = randi_range(1, 25)
var lines = []

func get_lines():
	match joke_num:
		pass
	return lines

func get_joke_type():
	return joke_num

func set_joke_type(num):
	joke_num = num
