extends Node2D


func _ready():
	$musciafundo.play()
	$Timer.start()
	pass 

func _process(delta):
	$CanvasLayer/Barravida.value = $DiscoVoador.VIDA
	pass


func _on_Timer_timeout():
	$NaveInimiga.intervalo = 1
	$Timer.stop()
	$Timer2.start()
	pass # Replace with function body.


func _on_Timer2_timeout():
	$Timer2.stop()
	$NaveInimiga.pode_atirar = false
	$AcceptDialog.popup()
	pass # Replace with function body.


func _on_AcceptDialog_confirmed():
	get_tree().change_scene("res://GameOver.tscn")
	pass # Replace with function body.
