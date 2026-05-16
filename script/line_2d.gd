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
var graph_num = 0 
var number
var now_button = 0
var endgraph=false
var final_pleasant
var customer : int = randi_range(1,4)
var minmax

signal startgraph


func _on_bungee_graph_number(line_number):
	graph_num=line_number
	emit_signal("startgraph")

func get_customer():
	match customer:
		1: 
			minmax=[1,3]
		2: 
			minmax=[1,6]
		3: 
			minmax=[1,9]
		4: 
			minmax=[1,12]
func get_graph():
	match graph_num:
		1:
			number = [2, [40, 4], [20, 5]]
		2:
			number = [2, [70, 4], [-10, 8]]
		3:
			number = [3, [30, 4], [0, 7], [10, 10]]
		4:
			number = [3, [20, 7], [0, 0], [20, 5]]

		5:
			number = [3, [95, 3], [-15, 1], [10, 3]]

		6:
			number = [3, [20, 8], [10, 9], [-20, 8]]

		7:
			number = [2, [60, 2], [-30, 9]]

		8:
			number = [3, [50, 5], [-10, 9], [30, 7]]

		9:
			number = [2, [20, 7], [-10, 10]]

		10:
			number = [2, [40, 3], [-10, 7]]

		11:
			number = [3, [30, 4], [10, 5], [10, 10]]

		12:
			number = [3, [80, 1], [10, 3], [5, 1]]

		13:
			number = [3, [20, 7], [30, 6], [20, 2]]

		14:
			number = [3, [80, 4], [-20, 2], [-20, 10]]

		15:
			number = [4, [15, 3], [5, 7], [20, 9], [20, 2]]

		16:
			number = [2, [40, 9], [-10, 7]]

		17:
			number = [3, [40, 4], [-10, 7], [-20, 10]]

		18:
			number = [2, [40, 5], [20, 9]]

		19:
			number = [3, [30, 4], [20, 5], [30, 10]]

		20:
			number = [3, [60, 2], [20, 1], [-60, 8]]

		21:
			number = [4, [90, 3], [-30, 2], [20, 9], [-50, 7]]

		22:
			number = [2, [80, 10], [-30, 5]]

		23:
			number = [3, [80, 4], [-20, 2], [-40, 10]]

		24:
			number = [4, [50, 5], [20, 4], [-30, 5], [30, 10]]

		25:
			number = [4, [60, 2], [-10, 4], [-20, 7], [-10, 10]]
		
	return number

func _ready():
	await startgraph
	clear_points()
	# 시작점을 (0,0)으로 설정
	last_position = Vector2(0,1080)
	add_point(last_position)
	print(graph_num)
	print()


func _on_timer_timeout():
	if graph_num!=0 and endgraph==false:
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
		print("현재 점 개수: ", get_point_count(), " | 위치: ", Vector2(new_pos))


func _on_surprise_pressed():
	# [디버깅용 프린트 추가] 버튼 누를 때마다 두 숫자를 비교해봅니다.
	
	if endgraph == true:
		return
	now_button += 1
	if now_button <= get_graph()[0]:
		max_boost_value=get_graph()[now_button][0] * -10
		boost_deduction_speed_value = 0.000001 * get_graph()[now_button][1]
		cur_boost_value = max_boost_value # Godot은 -Y가 위쪽이므로 위로 솟구치게 함
		print(get_graph()[now_button])
		
	else: 
		endgraph=true
		final_pleasant=minmax[0]+last_position.y/1080*(minmax[1]-minmax[0])
		print(final_pleasant)
		$Timer.stop()
