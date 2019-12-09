extends Node2D

var velo = 1000
var sentido
var x_inicial

func _ready():
	set_process(true)
	pass


func _process(delta):
	position = (position + Vector2(1,0) * (velo * sentido) * delta)
	if sentido == -1:
		$Sprite_kun.flip_v = true
	elif sentido == 1: 
		$Sprite_kun.flip_v = false
	
	# apaga o objeto após um tempo
	if position.x > x_inicial+2000 or position.x < x_inicial-2000: 
		print("sumiu")
		queue_free()
	pass

func set_pos_inicial(posicao, direcao):
	position = posicao
	position.y += 100
	sentido = direcao
	#--
	x_inicial = position.x
	pass


func _on_Area2D_kun_body_entered(body): #se tomar dano da kunai
	body.dano(30)
	queue_free()
	pass
