extends Node

var fsm: StateMachine
onready var Player = get_tree().get_root().get_node("/root/World/Player")

func enter():
	print("Hiding")
	Player.get_child(2).set_frame(6)

func exit(next_state):
	fsm.change_to(next_state)
	
func _process(delta):
	Player.get_child(2).play("Hiding (copy)")
	return delta

func input(event):
	return event

func unhandled_input(event):
	return event

func unhandled_key_input(event):
	return event
