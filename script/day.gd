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
	customer_num_now += score
func get_scream():
	return scream_score_now
func get_goal_scream():
	return scream_score_goal
	
func set_goal(score, customer):
	scream_score_goal = score
	customer_num_goal = customer
func set_day(yesterday):
	day_num = yesterday
