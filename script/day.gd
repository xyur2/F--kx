extends Node

class_name day

var day_num
var scream_score_goal
var scream_score_now = 0
var customer_num_now
var customer_num_goal = 0

func get_customer():
	return customer_num_now
func get_goal_customer():
	return customer_num_goal
func get_scream():
	return scream_score_now
func get_goal_scream():
	return scream_score_goal

func set_goal(score, customer):
	scream_score_goal = score
	customer_num_goal = customer
