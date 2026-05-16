extends Node
var states = ["ready", "pause", "ongame"]
var state
var today
var yesterday
var bungee_pos = Vector2(3000, 0)
var tower_pos = Vector2(0, 0)
var camera
var customer
var joke_final
var me
var is_waiting = true
var tower_my_line
var tower_customer_line
var bungee_my_line
var bungee_customer_line
var joke_scene
var chosen_button = 0
signal continued
signal button_chosen
signal graph_signal

func _ready():
	state = "ongame"
	camera = get_node("Camera2D")
	tower_my_line = get_node("Tower/MyTalkbox/TextEdit")
	tower_customer_line = get_node("Tower/CustomerTalkbox/TextEdit2")
	bungee_my_line = get_node("Bungee/MyTalkbox/TextEdit2")
	bungee_customer_line = get_node("Bungee/CustomerTalkbox/TextEdit2")
	joke_scene = get_node("Joke")
	joke_scene.visible = false
	print("씬 불러오기 성공")
	

	# _process 대신 _ready에서 시작
	if state == "ongame":
		start_game()

func start_game():
	print("게임 시작 성공")
	today = day.new()
	today.set_day(1)
	today.set_goal(0, 2)
	print("초기 설정 완료")
	for i in range(1, 15):
		await day_process()
		yesterday = today
		today = day.new()
		print(i, "일차 완료")

func day_process():
	var customer_num
	var lines
	var line_num_total
	var line_num_now

	print("손님 접대 시작")
	customer_num = today.get_goal_customer()
	for i in range(customer_num):
		customer = Customer.new()
		lines = [
			["me", "어서오세요! 번지점프 하러 오셨나요?"],
			["customer", customer.get_line1()],
			["me", "일단 여기 안전 서류부터 좀 작성해 주세요."],
			["customer", customer.get_line2()],
			["me", "음, 서류 확인했어요! 그럼 간단한 안전교육을 진행해 볼게요."],
			["me", "뛰어내리는 과정에서 줄이 몸을 감쌀 수 있어요."],
			["me", "이때 목이 졸리지 않게 머리를 팔로 감싸 주셔야 해요."],
			["customer", customer.get_line3()],
			["me", "물론 저희 번지점프대에선 한번도 사고가 난 적이 없답니다!"],
			["me", "자, 여기 안전장비에요. 착용하시고 준비가 되면 위로 같이 올라가시죠."]
		]
		# ----------- 안내 장면 --------------
		line_num_total = lines.size()
		today.increase_customer()
		camera.offset = tower_pos
		line_num_now = 0

		while line_num_now < line_num_total:
			await continued
			var speaker = lines[line_num_now][0]
			var line_now = lines[line_num_now][1]
			if speaker == "me":
				set_line_tower_me(line_now)
			elif speaker == "customer":
				set_line_tower_customer(line_now)
			else:
				print("speaker 지정에 문제 발생")
			
			line_num_now += 1
		print("손님 안내 완료")
		# ----------- 장난 선택 장면 --------------
		camera.offset = bungee_pos
		joke_scene.visible = true
		var joke_1 = joke.new()
		var joke_2 = joke.new()
		var joke_3 = joke.new()
		await button_chosen
		match chosen_button:
			1: joke_final = joke_1
			2: joke_final = joke_2
			3: joke_final = joke_3
		lines = joke_final.get_lines()
		
		print("장난 선택 완료")
		# ----------- 접대 장면 --------------
		line_num_total = lines.size()
		line_num_now = 0
		joke_scene.visible = false
		while line_num_now < line_num_total:
			await continued
			var speaker = lines[line_num_now][0]
			var line_now = lines[line_num_now][1]
			if speaker == "me":
				set_line_bungee_me(line_now)
			elif speaker == "customer":
				set_line_bungee_customer(line_now)
			else:
				print("speaker 지정에 문제 발생")
			
			graph_signal.emit(line_num_now)
			line_num_now += 1
		print("손님 접대 완료")

func set_line_tower_customer(line):
	tower_customer_line.text = line
	print(line)
func set_line_tower_me(line):
	tower_my_line.text = line
	print(line)
func set_line_bungee_customer(line):
	bungee_customer_line.text = line
	print(line)
func set_line_bungee_me(line):
	bungee_my_line.text = line
	print(line)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("continue"):
		emit_signal("continued")

func _on_button_pressed() -> void:
	chosen_button = 1
	emit_signal("button_chosen")

func _on_button_2_pressed() -> void:
	chosen_button = 2
	emit_signal("button_chosen")

func _on_button_3_pressed() -> void:
	chosen_button = 3
	emit_signal("button_chosen")
