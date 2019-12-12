extends Node2D

var velo = 500
var x_inicial

func _ready():
	$AudioStreamPlayer.play()
	set_process(true)
	pass

func _process(delta):
	position = (position + Vector2(1,0) * (velo) * delta)
	
	# apaga o objeto após um tempo
	if position.x > x_inicial+2000 or position.x < x_inicial-2000:
		queue_free()
	pass

func set_pos_inicial(posicao):
	position = posicao
	position.x += 100
	position.y +=10
	x_inicial = position.x
	pass


func _on_Area2D_body_entered(body):
	body.VIDA -= 300
	queue_free()
	pass # Replace with function body.
