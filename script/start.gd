extends Node2D

@onready var speed
var background1
var background2

func _ready():
	background1 = get_node("background")
	background2 = get_node("background2")
	
func _process(delta: float) -> void:
	background1.position.x -= speed
	background2.position.x -= speed
	if background1.position.x <= -2360:
		background1.position.x = 2360
	if background2.position.x <= -2360:
		background2.position.x = 2360
