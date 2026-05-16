extends Line2D
@export var last_position = Vector2.ZERO
@export var max_points: int = 40
@export var spacing: float = 40

var cur_boost_value: float = 0.0 # 버튼을 눌렀을 때 더해질 추가 수치
var max_boost_value = -300.0
var boost_deduction_speed_value = 0.1
var get_surprised = false
var target_new_pos = 0.0
var a=10
var b=3
var graph_num = randi_range(1,25)
var numbers
var now_button = 0
var scream_score

signal scream_val(value)

func get_graph():
	match graph_num:
		1: 
			numbers = [2,[20,a],[60,b]]
		2: 
			numbers = [2,[20,b],[70,b]]
		3: 
			numbers = [3,[20,3],[40,b],[30,b]]
		4: 
			numbers = [3,[20,b],[a,b],[40-a,b]]
		5: 
			numbers = [3,[5,b],[15,b],[-10,b]]
		6: 
			numbers = [3,[10,b],[60,b],[a,b]]
		7: 
			numbers = [2,[40,b],[30,b]]
		8: 
			numbers = [3,[70,b],[-10,b],[a,b]]
		9: 
			numbers = [2,[80,b],[10,b]]
		10: 
			numbers =[2,[10,b],[70,b]]
		11: 
			numbers =[3,[20,b],[40,b],[20,b]]
		12: 
			numbers =[4,[10,b],[0,b],[10,b],[a,b]]
		13: 
			numbers =[3,[20,b],[30,b],[a,b]]
		14: 
			numbers =[3,[20,b],[a,b],[70-a,b]]
		15: 
			numbers =[4,[5,b],[a,b],[55-a,b],[a,b]]
		16: 
			numbers =[2,[60,b],[a,b]]
		17: 
			numbers =[3,[20,b],[a,b],[70-a,b]]
		18: 
			numbers =[2,[a,b],[60-a,b]]
		19: 
			numbers =[3,[20,b],[a,b],[70-a,b]]
		20: 
			numbers = [3,[a,b],[80-a,b],[a,b]]
		21: 
			numbers =[4,[10,b],[a,b],[a,b],[a,b]]
		22: 
			numbers =[2,[80,b],[a,b]]
		23: 
			numbers =[3,[20,b],[a,b],[70-a,b]]
		24: 
			numbers =[4,[a,b],[20-a,b],[a,b],[70-a,b]]
		25: 
			numbers =[4,[a,b],[20-a,b],[a,b],[80-a,b]]
	return numbers


func _ready():
	clear_points()
	# 시작점을 (0,0)으로 설정
	last_position = Vector2(0,1000)
	add_point(last_position)
	print(graph_num)
	
func _on_timer_timeout():
	# Y좌표 변경x
	var offset = Vector2(spacing,cur_boost_value)
	# X좌표 구간 설정
	var new_pos = last_position + offset
	
	#버튼 상호작용
	if cur_boost_value == max_boost_value:
		cur_boost_value = 0
		get_surprised = true
		target_new_pos = new_pos.y+max_boost_value
		
	if get_surprised == true:
		new_pos.y = lerp(new_pos.y,target_new_pos,boost_deduction_speed_value)
	
	# 배경에 맞게 임계값 설정
	if new_pos.y < 0 :
		new_pos.y = 0
	if new_pos.y > 1080 :
		new_pos.y = 1080
			
	# 점 개수 제한 및 X 좌표 재정렬
	if get_point_count() > max_points:
		# 가장 오래된(왼쪽 끝) 점 삭제
		remove_point(0)
		# 남아있는 모든 점의 X 인덱스를 다시 계산해서 앞으로 당기기
		for i in range(get_point_count()):
			var current_pos = get_point_position(i)
			# i번째 점의 x좌표를 (0, 10, 20...) 순서로 재배치
			var updated_x = i * spacing
			set_point_position(i, Vector2(updated_x, current_pos.y))
			
		var updated_x = max_points * spacing
		new_pos = Vector2(updated_x, new_pos.y)
	
	last_position = new_pos
	# 점 추가
	add_point(Vector2(new_pos))
	
	# 디버깅: 점이 늘어나는지 출력창에서 확인
	#print("현재 점 개수: ", get_point_count(), " | 위치: ", Vector2(new_pos))

func _on_main_boost() -> void:
	if Input.is_action_just_pressed("continue"):
		now_button += 1
		if now_button <= get_graph()[0]:
			max_boost_value=get_graph()[now_button][0] * -10
			boost_deduction_speed_value = -0.015 * abs(get_graph()[now_button][1])
			cur_boost_value = max_boost_value # Godot은 -Y가 위쪽이므로 위로 솟구치게 함
			print(get_graph()[now_button])


func _on_bungee_button_pressed() -> void:
	# ------------- scream score 전달 ----------
	scream_score = get_scream_score()
	scream_val.emit(scream_score)
	# ------------ 초기화 -----------
	clear_points()
	last_position = Vector2(0, 1080)
	add_point(last_position)

	cur_boost_value = 0.0
	get_surprised = false
	target_new_pos = 0.0
	now_button = 0

	graph_num = randi_range(1, 25)
	get_graph()
	#print(graph_num)

func get_scream_score():
	return (1080-last_position.y)/1080
