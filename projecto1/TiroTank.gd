extends Node2D

var velo = -1000
var x_inicial
var forca = 450

func _ready():
	set_process(true)
	$Sprite_bomb.flip_h = true
	pass

func _process(delta):
	position = (position + Vector2(1,0) * (velo) * delta)
	
	# apaga o objeto após um tempo
	if position.x > x_inicial+2000 or position.x < x_inicial-2000:
		queue_free()
	pass

func set_pos_inicial(posicao):
	position = posicao
	position.y += 250
	x_inicial = position.x
	pass

func dano(valor):
	position.x -= valor
	print("bomba atingida")
	queue_free()



