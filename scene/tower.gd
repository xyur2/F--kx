extends Node2D
signal graph_number
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_graph_signal(line_num_now) -> void:
	graph_number.emit(line_num_now+1)
	pass # Replace with function body.
