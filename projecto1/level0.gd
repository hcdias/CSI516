extends Node2D

func _ready():
	$Avisolayer/Label.visible = false
	pass

func _on_Aviso_body_entered(body):
	if body.name == "KinematicBody2D":
		$Avisolayer/Label.visible = true
		$Timer.start()
		print("timer on")
	pass

func _on_Timer_timeout():
	$Avisolayer/Label.visible = false
	print("timer off")
	pass 

func _on_NextLevel_body_entered(body):
	if body.name == "KinematicBody2D":
		print("mudando de cena")
		get_tree().change_scene("res://level_1.tscn")
	pass
