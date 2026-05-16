extends CanvasLayer

func _ready() -> void:
	# 게임 시작할 때는 일시정지 화면을 숨겨둡니다.func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	
	hide()

func _input(event: InputEvent) -> void:
	# 1. ESC 키(pause 액션)를 눌렀을 때 일시정지 토글
	if event.is_action_pressed("pause"):
		toggle_pause()
		return # 키 입력 처리가 끝났으므로 함수 종료
	
	# 2. 게임이 일시정지 상태일 때, 화면 아무 곳이나 마우스 왼쪽 클릭하면 해제
	if get_tree().paused and event is InputEventMouseButton:
		# 마우스 왼쪽 버튼이 '눌렸을 때'만 작동 (떼었을 때 중복 실행 방지)
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			toggle_pause()

func toggle_pause() -> void:
	get_tree().paused = !get_tree().paused
	
	if get_tree().paused:
		show()
	else:
		hide()
