extends Node

class_name day

var day_num = 1
var scream_score_goal = 0
var scream_score_now = 0
var customer_num_now = 0
var customer_num_goal = 2

func get_customer():
	return customer_num_now
func increase_customer():
	customer_num_now += 1
func get_goal_customer():
	return customer_num_goal
func increase_scream(score):
	scream_score_now += score
func get_scream():
	return scream_score_now
func get_goal_scream():
	return scream_score_goal
	
func set_goal(yesterday_score, yesterday_customer):
	var object_score
	if yesterday_customer == 1:
		object_score = 2
	else:
		object_score = yesterday_customer * 4
	if yesterday_score <= object_score*0.5:
		customer_num_goal = yesterday_customer - randi_range(1, 3)
	elif yesterday_score <= object_score*0.75:
		customer_num_goal = yesterday_customer
	else:
		customer_num_goal = yesterday_customer + randi_range(1, 3)

func set_day(yesterday):
	day_num = yesterday
