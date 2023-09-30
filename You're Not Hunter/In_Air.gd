extends Node

var fsm: StateMachine
onready var Player = get_tree().get_root().get_node("/root/World/Player")

func enter():
	print("In_Air")
	Player.get_child(2).set_frame(5)

func exit(next_state):
	fsm.change_to(next_state)
	
func _process(delta):
	return delta

func input(event):
	return event

func unhandled_input(event):
	return event

func unhandled_key_input(event):
	return event
