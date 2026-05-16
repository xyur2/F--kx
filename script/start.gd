extends Node2D

@onready var speed = 2
var background1
var background2

func _ready():
	background1 = get_node("background")
	background2 = get_node("background2")
	background1.position = Vector2(980, 540)
	background2.position = Vector2(1980+980, 540)
	
func _process(delta: float) -> void:
	background1.position.x -= speed
	background2.position.x -= speed
	if background1.position.x <= -1000:
		background1.position.x = 1980+980
	if background2.position.x <= -1000:
		background2.position.x = 1980+980
