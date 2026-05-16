# ColorRect에 붙이는 스크립트
extends ColorRect

func _ready():
	material.set_shader_parameter("screen_width", size.x)
	material.set_shader_parameter("screen_height", size.y)
	material.set_shader_parameter("circle_size", 1.05)  # 완전히 열린 상태

func transition_out():
	var tween = create_tween()
	tween.tween_method(set_circle_size, 0.0, 1.05, 0.5)
	await tween.finished  # 추가

func transition_in():
	var tween = create_tween()
	tween.tween_method(set_circle_size, 1.05, 0.0, 0.5)
	await tween.finished  # 추가

func set_circle_size(value):
	material.set_shader_parameter("circle_size", value)
