extends KinematicBody2D


const UP = Vector2(0, -1)
const JUMP = 420
const MAXFALLSPEED = 500
const GRAVITY = 10
const WALKSPEED = 200


var motion = Vector2()

func _ready():
	$LevelAdvanceSFX.play()

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y =MAXFALLSPEED
	if Input.is_action_just_pressed("JUMP") && $RayCast2D.is_colliding() or Input.is_action_just_pressed("JUMP") && $RayCast2D2.is_colliding():
		motion.y = -JUMP
		$JumpSFX.play()
		
	motion = move_and_slide(motion, UP)
	
	if Input.is_action_pressed("mLeft"):
		motion.x = -WALKSPEED
	if Input.is_action_just_released("mLeft"):
		motion.x = 0
	if Input.is_action_pressed("mRight"):
		motion.x = WALKSPEED
	if Input.is_action_just_released("mRight"):
		motion.x = 0
	if Input.is_action_pressed("mLeft") && Input.is_action_pressed("mRight"):
		motion.x = 0
		
	if Input.is_action_just_released("Restart"):
		get_tree().reload_current_scene()


func _on_Teleport1_body_entered(body):
	if body.name == "Player1":
		self.global_transform.origin = Vector2(60, 57)


func _on_Teleport2_body_entered(body):
	self.global_transform.origin = Vector2(366, 88)
