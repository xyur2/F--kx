extends Line2D
@export var last_position = Vector2.ZERO
@export var max_points: int = 40
@export var spacing: float = 40

var cur_boost_value: float = 0.0 # 버튼을 눌렀을 때 더해질 추가 수치
var max_boost_value = -300.0
var get_surprised = false
var target_new_pos = 0.0

func _ready():
	clear_points()
	# 시작점을 (0,0)으로 설정
	last_position = Vector2.ZERO
	add_point(last_position)
	
	
func _on_timer_timeout():
	# Y좌표 변경x
	var offset = Vector2(spacing,cur_boost_value)
	
		
	# X좌표 구간 설정
	var new_pos = last_position + offset
	
	#버튼 상호작용
	if cur_boost_value == max_boost_value:
		cur_boost_value = 0
		get_surprised = true
		target_new_pos = new_pos.y+300.0
		
	if get_surprised == true:
		new_pos.y = lerp(new_pos.y,target_new_pos,0.003)
	
	# 배경에 맞게 임계값 설정
	if new_pos.y > 0 :
		new_pos.y = 0
	if new_pos.y < -648 :
		new_pos.y = -648
			
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
	
		
func _on_button_pressed():
	print("버튼 클릭! 수치 급상승")
	cur_boost_value = max_boost_value # Godot은 -Y가 위쪽이므로 위로 솟구치게 함
