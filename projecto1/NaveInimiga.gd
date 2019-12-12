extends Node2D

var target
var speed = 1
var direc
var motion

var pode_atirar = true
var intervalo = 2
var ultimo_disparo = 0
var pre_disparo1 = preload("res://TiroCurto.tscn")

func _ready():
	target = get_parent().get_node("DiscoVoador")
	pass 

func _process(delta):
	if target != null:
		direc = (target.position.y - position.y)
		motion = direc * speed * delta
		position.y += motion
		
	if ultimo_disparo > 0:
			ultimo_disparo -= delta
		
	if ultimo_disparo <= 0 and pode_atirar:
		disparo()
	pass

func disparo():
	var kabum1 = pre_disparo1.instance()
	kabum1.set_pos_inicial(global_position)
	get_node("../").add_child(kabum1)
	ultimo_disparo = intervalo
	pass
