extends Node
var states = ["ready", "pause", "ongame"]
var state
var today
var yesterday
var bungee_pos = Vector2(3000, 0)
var tower_pos = Vector2(0, 0)
var camera

func _ready():
	state = "ready"
	camera = get_node("Camera2D")

func start():
	if state == "ready":
		pass
	elif state == "ongame":
		today = day.new()
		var customer_num
		
		today.set_day(1)
		today.set_goal(0, 2)
		for days in range(1, 14):
			# ------- 장사 시작 ----------
			customer_num = today.get_goal_customer()
			for i in range(customer_num):
				today.increase_customer()
				camera.set_viewport(tower_pos)
				# 대사 부분
				camera.set_viewport(bungee_pos)
			# ------- 장사 끝 ----------
			yesterday = today
			today = day.new()
			
	elif state == "pause":
		pass
