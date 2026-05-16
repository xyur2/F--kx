extends Sprite2D

var cur 
var fin 
var scream 
var Day
# Called when the node enters the scene tree for the first time.
func _ready():
	cur = get_node("recorder/Label")
	fin = get_node("recorder/Label2")
	scream = get_node("recorder/Label3")
	Day = day.new()
	Day.set_day(1)
# Called every frame. 'delta' is the elapsed time since the previous frame.

#func _process(delta: float) -> void:
	#cur.text(str(Day.get_customer()))
	#fin.text(str(Day.get_goal_customer()))
	#scream.text(str(Day.get_scream()))
