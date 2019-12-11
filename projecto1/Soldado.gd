extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.5
var VIDA = 100
var forca = 100 # força do dano q o inimigo dá

func _ready():
	$Sprite.play("walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 500

func _process(delta):
	movimentar()

func movimentar():
	if(posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$Sprite.flip_h = true
		if($".".position.x >= posicao_final):
			flip = false

	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$Sprite.flip_h = false
		if($".".position.x <= posicao_inicial):
			flip = true

func dano(valor):
	get_node("Animacao").play("dano")
	VIDA -= valor
	if VIDA <= 0:
		get_node("Animacao").play("morte")

func morrer():
	queue_free()