extends KinematicBody2D
class_name Player

onready var fSM = $StateMachine

const Gravity = 15
const MaxFallSpeed = 200
const Speed = 130
const Accel = 20
const Jumpforce = 375

var facingR = true
var motion = Vector2()
var stress = 0

func _ready():
	self.position = get_parent().get_node("Rooms").get_child(0).get_node("PlayerSpawn/Pos").position
	$AnimPlayer.play("Idle")
	
func _process(_delta):
	
	$Sprite.set_flip_h(facingR)
	
	if Input.is_action_pressed("Right") and !Input.is_action_pressed("Left") and fSM.state.name != "Hiding":
		if Input.is_action_pressed("Run"):
			motion.x += Accel*(stress+1)
			motion.x = min(motion.x, Speed*(stress+1))
		else:
			motion.x = 80*(stress+1)
		facingR = true
	elif Input.is_action_pressed("Left") and !Input.is_action_pressed("Right") and fSM.state.name != "Hiding":
		if Input.is_action_pressed("Run"):
			motion.x -= Accel*(stress+1)
			motion.x = max(motion.x, -Speed*(stress+1))
		else:
			motion.x = -80*(stress+1)
		facingR = false
	else:
		motion.x = lerp(motion.x,0,0.2)

	if is_on_floor():
		if Input.is_action_pressed("Jump") and fSM.state.name != "Hiding":
			motion.y = -Jumpforce
			
		else :
			motion.y = 0
	else :
		if motion.y > MaxFallSpeed:
			motion.y = MaxFallSpeed
		else : motion.y += Gravity
	
	
	if Input.is_action_just_released("Jump"):
		motion.y += Gravity

	motion = move_and_slide(motion, Vector2.UP)
	
	# StateUpdateSys
	if !is_on_floor():
		fSM.change_to("In_Air")
	elif Input.is_action_pressed("Hiding") and is_on_floor():
		fSM.change_to("Hiding")
	elif get_parent().xor(Input.is_action_pressed("Left"), Input.is_action_pressed("Right")) :
			fSM.change_to("Moving")
	elif !Input.is_action_pressed("Hiding"):
		fSM.change_to("Idle")
