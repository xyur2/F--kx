extends Node2D
class_name Customer

var personalities = ["Cower", "Bragger", "Mania", "Master"]
var shapes = [1, 2, 3]
var chrshape = shapes.pick_random()
var personality = personalities.pick_random()

func get_line1():
	var lines
	match personality:
		"Cower":
			lines = [
				"네..전 제 인생한테 밀려서\n여기까지 왔어요.",
				"제가 대체 왜\n여기 있는 걸까요.",
				"아뇨..\n전 사실 귀가를 하고싶..."
			]
		"Bragger":
			lines = [
				"너는나를존중해야한다나는500회가넘는번지점프에서살아남았으며…",
				"이 정도로 무서워하면\n엘리베이터도 못 타죠~",
				"아 긴장한 척 좀\n해드려야하나",
				"뛰는 싸나에"
			]
		"Mania":
			lines = [
				"이런 곳에 번지점프가 있다니!!",
				"번지점프 요이~",
				"음~ 공기만 맡았는데도\n벌써 신이 나네요!"
			]
		"Master":
			lines = [
				"후후",
				"당연하죠. 빠르게 갑시다",
				"전 번지점프 장인이에요"
			]
	return lines.pick_random()

func get_line2():
	var lines
	match personality:
		"Cower":
			lines = [
				"어후 긴장돼…\n서류는 여기 있어요오..",
				"하..서류 쓰다가\n유서 쓸 뻔했어요..",
				"와..잠시만\n이름에 지진났는데\n이거 괜찮나요?"
			]
		"Bragger":
			lines = [
				"…",
				"이런 건 너무 많이 써봐서\n이제 익숙해요",
				"쓰는 속도 보이시죠?\n이게 자신감입니다 ㅋ",
				"울퉁불퉁"
			]
		"Mania":
			lines = [
				"저 지금 너~무 설레요",
				"완전히 요이야~",
				"사인 완료! 빨리 가시죠"
			]
		"Master":
			lines = [
				"느려",
				"네, 여기 제출하면 되죠?",
				"전 서류 작성 장인이에요"
			]
	return lines.pick_random()

func get_line3():
	var lines
	match personality:
		"Cower":
			lines = [
				"분명 안전교육인데\n전 왜 생명의 위협을 느낄까요..",
				"설명을 들을수록\n포기하고싶네..",
				"와..줄이 몸에요..?\n목이요..?\n저 죽는 건 아니죠..?"
			]
		"Bragger":
			lines = [
				"나는감정없는싸이코라그런가이런거듣고미동도안함. 오히려웃음이나온달까?",
				"아 오늘 또\n멋진 거 보여드려야겠네",
				"뭐 저는 안전교육?\n이런거 필요없어요~",
				"머리 감싸는 인간 여자"
			]
		"Mania":
			lines = [
				"전 떨어질 생각만 하면\n자꾸 웃음이 나와요 흐흐",
				"요이히~",
				"이제 올라가면서\n설렐 일만 남았네요"
			]
		"Master":
			lines = [
				"알아",
				"이제 뛰어내리기만 하면 되겠네요",
				"전 머리 감싸기 장인이에요"
			]
	return lines.pick_random()

func get_shape():
	return chrshape

func get_personality():
	return personality
