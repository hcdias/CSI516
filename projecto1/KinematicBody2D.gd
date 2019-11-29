extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 25
const SPEED = 350
const JUMP = -700
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP
			$Sprite.play("jump")
	else:
		$Sprite.play("jump")
	
	motion = move_and_slide(motion,UP)