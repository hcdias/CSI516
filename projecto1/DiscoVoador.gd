extends KinematicBody2D

#var motion = Vector2()
#const movX = Vector2(0,1)
var speed = 3

func _ready():
	pass 

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= speed
	if Input.is_action_pressed("ui_down"):
		position.y += speed
	
	pass
