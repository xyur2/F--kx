extends Node

class_name joke

var joke_num = randi_range(1, 25)
var lines

func get_lines():
	match joke_num:
		1:
			lines = [
				["me", "줄이 낡았네요"],
				["customer", "네?"]
			]
		2:
			lines = [
				["me", "셋까지 셀게요"],
				["me", "3"],
				["customer", "3"],
				["me", "2"],
				["customer", "2"],
				["me", "1"],
				["customer", "1"],
			]
		3:
			lines = [
				["me", "이제 뛰셔도 됩니다!"],
				["me", "손님 도대체 언제 뛰실 거예요?"],
				["customer", "못 하겠어요"],
				["me", "손님그럼 제가 해드릴게요"],
				["customer", "어? 잠시만요!"]
			]
		4:
			lines = [
				["me", "손님 이제 뛰실래요?"],
				["customer", "꺄악! 꺄아악!!"],
				["customer", "잠시만요!!!"],
				["customer", "꺄아악!!!!!!!!!!"]
			]
		5:
			lines = [
				["me", "손님 안 무서우세요?"],
				["customer", "네! 가장 스릴 넘치게 부탁드려요"],
				["me", "네~"]
			]
		6:
			lines = [
				["me", "번지점프 사고가 50만 번 점프에 한번씩 일어난대요."],
				["customer", "이 줄 안 끊어지죠? 안전한거죠?"],
				["customer", "저 죽지는 않죠?"],
				["me", "직접 경험해보세여"],
				["customer", "네?"]
			]
		7:
			lines = [
				["me", "사진 찍어드릴까요?"],
				["customer", "네, 저 사진 좀 찍어주세요"],
				["me", "그만 찍으세요"]
			]
		8:
			lines = [
				["me", "안 무서우세요?"],
				["customer", "전 진짜 하나도 안 무서워요"],
				["me", "그럼 날아볼까요?"],
				["customer", "잠깐만요!!"]
			]
		9:
			lines = [
				["me", "왜 가만히 계세요?"],
				["customer", "다리가 안 움직여요"],
				["me", "걱정마세여 제가 뛰게 해드릴게요"],
				["customer", "어? 어?"]
			]
		10:
			lines = [
				["me", "갑니다?"],
				["customer", "아 잠시만요!!"]
			]
		11:
			lines = [
				["me", "여기까지 오신 거면 이미 반은 성공하셨어요~"],
				["customer", "나머지 반은 어떡하죠"],
				["me", "제가 채워드릴게요~"],
			]
		12:
			lines = [
				["me", "올라오니까 어때요?"],
				["customer", "재밌겠다"],
				["me", "제일 재밌게 해드릴게여~"],
				["customer", "네~~"]
			]
		13:
			lines = [
				["me", "ㅎㅎ"],
				["customer", "잠깐만요 잠깐만 잠깐 진짜 제발 잠깐만요!!"],
			]
		14:
			lines = [
				["me", "올라오니까 어때요?"],
				["customer", "재밌겠다"],
				["me", "제일 재밌게 해드릴게여~"],
				["customer", "네~~"]
			]
		14:
			lines = [
				["me", "발 밑에 풍경 한 번 보실래요?"],
				["customer", "오! 생각보다 높.."],
				["me", "잘 다녀오세요~"],
			]
		15:
			lines = [
				["me", "생각보다 금방 끝나요~"],
				["customer", "그래도 전 무섭다고요!ㅠㅜ"],
				["me", "네에~ 그럼 밀게요~~"],
				["customer", "으아아아아악!!!!"]
			]
		16:
			lines = [
				["me", "마지막으로 할 말 있으신가요??"],
				["customer", "엄마 사랑해애액!!"]
			]
		17:
			lines = [
				["me", "손님 믿으셔야해요"],
				["customer", "뭐를요ㅠㅜㅠ"],
				["me", "저랑 줄을요"]
			]
		18:
			lines = [
				["me", "더우신가요?"],
				["customer", "긴장해서 땀나요ㅜㅠ"],
				["me", "곧 땀 식으실거예요~"]
			]
		19:
			lines = [
				["me", "준비되셨나요?"],
				["customer", "아니요 아직.."],
				["me", "저만 준비되면 돼요~"]
			]
		20:
			lines = [
				["me", "뛸게요!!"],
				["customer", "아직 연결 안 됐어..요.."],
				["me", "으악!!!"]
			]
		21:
			lines = [
				["me", "자 이제 갑니다"],
				["customer", "예~~~"],
				["me", "엇 왜 줄이 여기에..?"],
				["customer", "으악!!!"]
			]
		22:
			lines = [
				["me", "오늘따라 줄이 좀 긴데요..?"],
				["customer", "네?"]
			]
		23:
			lines = [
				["me", "긴장하지마세요 섄디, 이건 레저일 뿐이에요"],
				["customer", "네? 전 섄디가 아닌데요"],
				["me", "제가 섄디예요"]
			]
		24:
			lines = [
				["customer", "이거 이용하면서 다치거나 죽은 사람들은 없죠..?"],
				["me", "그럼요ㅎㅎ 다친 사람들은 없죠ㅎㅎ"],
				["customer", "죽은 사람들은요..?"],
				["me", "..."]
			]
		25:
			lines = [
				["customer", "이거 이용하면서 사고난 사람들은 없죠..?"],
				["me", "그럼요ㅎㅎ 오늘은 아직 없어요ㅎㅎ"],
				["customer", "예..?"]
			]
	return lines

func get_joke_type():
	return joke_num

func set_joke_type(num):
	joke_num = num
