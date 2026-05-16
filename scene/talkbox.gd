extends Node2D
@export var mine : int = 0
func _ready():
	# 1. 부모 노드를 가져옵니다.
	var p = get_parent()
	
	# 2. 부모 노드가 완전히 준비(ready)될 때까지 안전하게 한 턴 기다립니다.
	if p and not p.is_node_ready():
		await p.ready
	
	# 3. 이제 부모의 스크립트와 변수가 다 로드되었으므로 안전하게 사용합니다!
	if p and "number" in p:
		print("부모의 숫자 가져오기 성공: ", p.number)
		# 여기에 원래 하려던 작업을 작성하세요! (예: $Sprite2D/Label.text = str(p.number))
	else:
		print("부모 노드를 찾지 못했거나, 부모 스크립트에 'number' 변수가 없습니다.")

func _process(delta: float) -> void:
	var p = get_parent()
	if p != null:
		if mine == p.number:
			visible = true
	
