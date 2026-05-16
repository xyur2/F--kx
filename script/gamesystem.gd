extends Node
var states = ["ready", "pause", "ongame"]
var state
var today
var yesterday
var bungee_pos = Vector2(0, 2000)
var tower_pos = Vector2(0, 0)
var start_pos = Vector2(0, 4000)
var dayend_pos = Vector2(0, 6000)
var endiing_pos = Vector2(0, 8000)
var camera
var customer
var is_animating = false
var scream_score = 0
var joke_final
var me
var is_waiting = true
var tower_my_line
var tower_customer_line
var bungee_my_line
var bungee_customer_line
var joke_scene
var chosen_button = 0
var jumped = false
var transition
var is_bungee = false
var bungee_customer

var bungee_me_animation
var bungee_customer_animation
var bungee_hand
var joke_me_animation
var tower_me_animation
var tower_customer_animation
var sender
var pointer
var cur 
var fin 
var scream 
var Day
var ending
# Called when the node enters the scene tree for the first time.


signal continued
signal button_chosen
signal boost
signal bungee
signal bungee_continued
signal fallen

func _ready():
	state = "ready"
	camera = get_node("Camera2D")
	tower_my_line = get_node("Tower/MyTalkbox/TextEdit")
	tower_customer_line = get_node("Tower/CustomerTalkbox/TextEdit2")
	bungee_my_line = get_node("Bungee/MyTalkbox/TextEdit")
	bungee_customer_line = get_node("Bungee/CustomerTalkbox/TextEdit2")
	joke_scene = get_node("Joke")
	cur = get_node("Tower/recorder/Label")
	fin = get_node("Tower/recorder/Label2")
	scream = get_node("Tower/recorder/Label3")
# Called every frame. 'delta' is the elapsed time since the previous frame.
	bungee_me_animation = get_node("Bungee/Me/AnimatedSprite2D")
	bungee_customer_animation = get_node("Bungee/Customer/AnimatedSprite2D")
	bungee_hand = get_node("Bungee/AnimatedSprite2D")
	tower_me_animation = get_node("Tower/Me/AnimatedSprite2D")
	tower_customer_animation = get_node("Tower/Customer/AnimatedSprite2D")
	joke_me_animation = get_node("Joke/Me/AnimatedSprite2D")
	bungee_customer = get_node("Bungee/Customer")
	pointer = get_node("Bungee/BungeeBackground2")
	
	joke_scene.visible = false
	transition = get_node("CanvasLayer/Transition")
	print("씬 불러오기 성공")

	# _process 대신 _ready에서 시작
	if state == "ready":
		main_scene()

func final_ending(ending):
	pass

func main_scene():
	camera.offset = start_pos
	await continued
	await transition.transition_in()  # 닫기
	state = "ongame"
	start_game()
	
func start_game():
	print("게임 시작 성공")
	today = day.new()
	today.set_day(1)
	print("초기 설정 완료")
	for i in range(1, 15):
		await day_process()
		yesterday = today
		today = day.new()
		today.set_goal(yesterday.get_scream(), yesterday.get_customer())
		cur.text=str(today.get_customer())
		fin.text=str(today.get_goal_customer())
		scream.text=str(today.get_scream())
		await endday(yesterday.get_scream(), yesterday.get_customer())
		ending = 2
		if today.get_goal_customer() <= 0:
			ending = 1
			break
	final_ending(ending)

func endday(score, customer):
	camera.offset = dayend_pos
	var final_score
	var textbox = get_node("Dayend/Label")
	var ment
	var ment_list
	if customer == 1:
		final_score = min(score, 2)/2 * 100
	else:
		final_score = min(score, customer*4)/(customer*4)*100
	if final_score >= 75:
		ment_list = [
			"멋진 하루였어!",
			"손님들의 비명소리가 듣기 좋네~",
			"손님들이 더 늘어날 것 같아!"
		]
	elif final_score >= 50:
		ment_list = [
			"평범한 하루였어.",
			"손님이 더 늘어나면 좋겠어!",
			"손님들을 더 놀라게 하고싶은데.."
		]
	else:
		ment_list = [
			"좀 더 분발해야겠는걸..",
			"손님이 더 줄어들면 곤란해!",
			"손님 응대에는 영 소질이 없나봐.."
		]
	ment = ment_list.pick_random()
	var text = "오늘 손님 수 : " + str(customer) + "\n오늘의 점수 : " + str(snapped(final_score, 0.01)) + "점"+ "\n\n"+ment
	textbox.text = text
	await transition.transition_out()         # 닫기
	await get_tree().create_timer(3.0).timeout
	await transition.transition_in()         # 열기

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
			["me", "어서오세요!\n번지점프 하러 오셨나요?"],
			["customer", customer.get_line1()],
			["me", "일단 여기 안전 서류부터\n좀 작성해 주세요."],
			["customer", customer.get_line2()],
			["me", "음, 서류 확인했어요!\n그럼 간단한 안전교육을 진행해 볼게요."],
			["me", "뛰어내리는 과정에서\n줄이 몸을 감쌀 수 있어요."],
			["me", "이때 목이 졸리지 않게\n머리를 팔로 감싸 주셔야 해요."],
			["customer", customer.get_line3()],
			["me", "물론 저희 번지점프대에선\n한번도 사고가 난 적이\n없답니다!"],
			["me", "자, 여기 안전장비에요.\n착용하시고 준비가 되면\n위로 같이 올라가시죠."]
		]
		# ----------- 안내 장면 --------------
		line_num_total = lines.size()
		today.increase_customer()
		camera.offset = tower_pos
		set_shape(tower_customer_animation, customer.get_shape(), 1)
		await transition.transition_out()         # 열기
		line_num_now = 0
		set_line_bungee_me("...")
		set_line_bungee_customer("...")
		
		cur.text=str(today.get_customer())
		fin.text=str(today.get_goal_customer())
		scream.text=str(snapped(today.get_scream(), 0.01))

		while (line_num_now < line_num_total):
			await continued
			var speaker = lines[line_num_now][0]
			var line_now = lines[line_num_now][1]
			if speaker == "me":
				set_line_tower_me(line_now)
				tower_me_animation.play("talk")
			elif speaker == "customer":
				set_line_tower_customer(line_now)
				tower_me_animation.play("default")
			else:
				print("speaker 지정에 문제 발생")
			
			line_num_now += 1
		await continued
		print("손님 안내 완료")
		tower_me_animation.play("default")
		
		await transition.transition_in()  # 닫기
		set_line_tower_me("...")
		set_line_tower_customer("...")
		camera.offset = bungee_pos
		joke_scene.visible = true
		pointer.position = Vector2(980.0, 540.0)
		set_shape(bungee_customer_animation, customer.get_shape(), 2)
		
		
		# ----------- 장난 선택 장면 --------------
		joke_me_animation.play("smile")
		var joke_1 = joke.new()
		var joke_2 = joke.new()
		var joke_3 = joke.new()
		
		var button1 = get_node("Joke/Button/Label")
		var button2 = get_node("Joke/Button2/Label")
		var button3 = get_node("Joke/Button3/Label")
		button1.text = joke_1.get_joke_name()
		button2.text = joke_2.get_joke_name()
		button3.text = joke_3.get_joke_name()
		await transition.transition_out()         # 열기
		await button_chosen
		match chosen_button:
			1: joke_final = joke_1
			2: joke_final = joke_2
			3: joke_final = joke_3
		lines = joke_final.get_lines()
		
		print("장난 선택 완료")
		joke_scene.visible = false
		# ----------- 접대 장면 --------------
		is_bungee = true
		line_num_total = lines.size()
		line_num_now = 0
		print("line_num_total: ", line_num_total)
		print("lines: ", lines)
		jumped = false
		while (line_num_now < line_num_total):
			print("while started")
			await bungee_continued
			if jumped:
				break
			var speaker = lines[line_num_now][0]
			var line_now = lines[line_num_now][1]
			if speaker == "me":
				set_line_bungee_me(line_now)
				bungee_me_animation.play("talk")
			elif speaker == "customer":
				set_line_bungee_customer(line_now)
				bungee_me_animation.play("default")
				set_shape(bungee_customer_animation, customer.get_shape(), 3)
			else:
				print("speaker 지정에 문제 발생")
			line_num_now += 1
			emit_signal("boost")
		bungee_me_animation.play("smile")
		await bungee
		bungee_hand.play("bye")
		set_shape(bungee_customer_animation, customer.get_shape(), 4)
		var customer_tween = create_tween()
		var new_pos = Vector2(bungee_customer.position.x, bungee_customer.position.y+1500)
		var pos = Vector2(bungee_customer.position.x, bungee_customer.position.y)
		customer_tween.tween_property(bungee_customer, "position", new_pos, 1)

		await fallen
		jumped = false
		print("손님 접대 완료")
		is_bungee = false
		await transition.transition_in()  # 닫기
		bungee_customer.position = pos
		camera.offset = bungee_pos
		bungee_hand.play("default")

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
func carculate_score(score, type):
	var final_score
	match type:
		"Cower" : final_score = 1 + score*2
		"Bragger" : final_score = 1 + score*5
		"Mania" : final_score = 1 + score*8
		"Master" : final_score = 1 + score*11
	return final_score

func score_bar(score):
	print("score bar 진입")
	if is_animating:
		return
	is_animating = true
	var pointer_tween = create_tween()
	var position = Vector2(pointer.position.x, pointer.position.y)
	var new_position = Vector2(pointer.position.x, pointer.position.y-450*score)
	print("현재 포인터 위치: ", pointer.position)
	print("목표 위치: ", new_position)
	print("score: ", score) 
	pointer_tween.tween_property(pointer, "position", new_position, 1)
	await pointer_tween.finished
	print("스코어바 이동")
	pointer_tween = create_tween()
	pointer_tween.tween_property(pointer, "position", position, 1)
	await pointer_tween.finished
	print("스코어바 원위치")
	pointer_tween = create_tween()
	pointer_tween.tween_property(pointer, "position", position, 1)
	await pointer_tween.finished
	print("신호")
	is_animating = false
	var personal_score = carculate_score(score, customer.get_personality())
	today.increase_scream(personal_score)
	emit_signal("fallen")

func set_shape(where, chr, num):
	if chr == 1:
		match num:
			1 : where.play("c1_1")
			2 : where.play("c1_2")
			3 : where.play("c1_3")
			4 : where.play("c1_4")
	elif chr == 2:
		match num:
			1 : where.play("c2_1")
			2 : where.play("c2_2")
			3 : where.play("c2_3")
			4 : where.play("c2_4")
	else:
		match num:
			1 : where.play("c3_1")
			2 : where.play("c3_2")
			3 : where.play("c3_3")
			4 : where.play("c3_4")

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("continue"):
		if is_bungee:
			emit_signal("bungee_continued")
			print("bungee continue")
		else:
			emit_signal("continued")
			print("continue")

func _on_button_pressed() -> void:
	chosen_button = 1
	emit_signal("button_chosen")

func _on_button_2_pressed() -> void:
	chosen_button = 2
	emit_signal("button_chosen")

func _on_button_3_pressed() -> void:
	chosen_button = 3
	emit_signal("button_chosen")

func _on_bungee_button_pressed() -> void:
	jumped = true
	emit_signal("bungee_continued")  # while 탈출
	emit_signal("bungee")

func _on_line_2d_scream_val(value: Variant) -> void:
	scream_score = value
	score_bar(scream_score)
