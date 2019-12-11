extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.5
var VIDA = 500
var is_vivo = true
var forca = 300 # força do dano q o inimigo dá no player

var pode_atirar = false
var intervalo = 2
var ultimo_disparo = 0
var pre_disparo = preload("res://TiroTank.tscn")

func _ready():
	$Sprite.play("moving")
	$Sprite.flip_h = true
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 500

func _process(delta):
	if is_vivo:
		movimentar()
		if ultimo_disparo > 0:
			ultimo_disparo -= delta
		
		if ultimo_disparo <= 0 and pode_atirar:
			disparo()
	

func movimentar():
	if(posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		if($".".position.x >= posicao_final):
			flip = false

	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		if($".".position.x <= posicao_inicial):
			flip = true

func disparo():
	var kabum = pre_disparo.instance()
	kabum.set_pos_inicial(global_position)
	get_node("../").add_child(kabum)
	$tirofx.play()
	$Sprite.animation = "shot"
	ultimo_disparo = intervalo

func dano(valor):
	get_node("Animacao").play("dano")
	VIDA -= valor
	if VIDA <= 0:
		is_vivo = false
		$Sprite.play("die")


func morrer():
	queue_free()

func _on_Sprite_animation_finished():
	if $Sprite.animation == "shot":
		$Sprite.animation = "moving"
		
	elif $Sprite.animation == "die":
		get_node("Animacao").play("morte")
	pass

#-------------------controle do disparo ------------------
func _on_AreaTiro_body_entered(body):
	if body.name == "KinematicBody2D":
		pode_atirar = true
	pass

func _on_AreaTiro_body_exited(body):
	if body.name == "KinematicBody2D":
		pode_atirar = false
	pass

