extends KinematicBody2D

var speed = 5
var VIDA = 5000

func _ready():
	$Exhaust.play("exhaust")
	pass 

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= speed
	if Input.is_action_pressed("ui_down"):
		position.y += speed
	
	if VIDA <= 0:
		get_tree().paused = true
		$Mortefx.play()
	pass

func _on_Mortefx_finished():
	get_tree().change_scene("res://GameOver.tscn")
	pass # Replace with function body.
