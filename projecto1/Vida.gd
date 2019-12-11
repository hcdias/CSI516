extends Area2D


func _on_Vida_body_entered(body):
	if body.name == "KinematicBody2D":
		$Som.play()
		if body.VIDA <= 500:
			body.VIDA += 500
		else:
			body.VIDA = 1000
	pass 


func _on_Som_finished():
	queue_free()
	pass 
