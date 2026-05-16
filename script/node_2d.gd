extends Node2D # 이 줄을 스크립트 맨 첫 줄(1번 라인)에 적어주세요!

var number : int = 0
# ... 그 아래에는 원래 작성하시려던 코드를 이어서 적으시면 됩니다.
func _on_surprise_pressed():
	print("루트 노드가 버튼 신호를 받았습니다!")
	number += 1
