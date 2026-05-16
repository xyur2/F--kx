extends Node2D

@onready var speed = 2
var background1
var background2

func _ready():
	background1 = get_node("background")
	background2 = get_node("background2")
	background1.position = Vector2(0, 0)
	background2.position = Vector2(2360, 0)
	
func _process(delta: float) -> void:
	background1.position.x -= speed
	background2.position.x -= speed
	if background1.position.x <= -2360:
		background1.position.x = 2360
	if background2.position.x <= -2360:
		background2.position.x = 2360
