extends KinematicBody2D

var VIDA = 1000
const UP = Vector2(0,-1)
const GRAVITY = 25
const SPEED = 350
const JUMP = -700
var motion = Vector2()
var animation_control = false

var intervalo = .5
var ultimo_disparo = 0
var pre_kunai = preload("res://Kunai.tscn")

func _ready():
	$MusicadFundo.play()
	print(global_position)

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		if animation_control == false:
			$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		if animation_control == false:
			$Sprite.play("run")
	else:
		if animation_control == false:
			$Sprite.play("idle")
	
	if Input.is_action_just_pressed("kunai"):
		$kunaifx.play()
		
	if Input.is_action_pressed("kunai"):
		$Sprite.play("kunai")
		animation_control = true
	
	if Input.is_action_just_pressed("attack"):
		$espadafx.play()
	
	if Input.is_action_pressed("attack"):
		$Sprite.play("sword")
		animation_control = true
	
	if !is_on_floor():
		if animation_control == false:
			$Sprite.play("jump")
	
	if Input.is_action_just_pressed("ui_up"):
		$Sprite.play("jump")
		$pulofx.play()
		animation_control = true
	
	if Input.is_action_just_pressed("ui_down"):
		$chiarfx.play()
		
	if Input.is_action_pressed("ui_down"):
		$Sprite.play("slide")
		animation_control = true
	
	if Input.is_action_just_released("ui_down"):
		animation_control = false
		$chiarfx.stop()
	
	if VIDA <= 0: # controle da morte do personagem
		$MusicadFundo.stop()
		$Sprite.play("die")
		animation_control = true

func _physics_process(delta):
	motion.y += GRAVITY
	$BarraVida/Barra_vida.value = VIDA
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		# ------------- correr ------------
		if Input.is_action_pressed("run"):
			motion.x = SPEED*2
			$Sprite.speed_scale = 10
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		if Input.is_action_pressed("run"):
			motion.x = -(SPEED*2)
			$Sprite.speed_scale = 10
	else:
		motion.x = 0
	
	if Input.is_action_just_released("run"):
		$Sprite.speed_scale = 5
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP
	
	motion = move_and_slide(motion,UP)
	
	# ------------------disparar kunai----------------------
	if Input.is_action_pressed("kunai"):
		disparar_kunai()
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
	
	#----------------- ataque de espada -------------------
	if Input.is_action_pressed("attack"):
		$Espada/CollShapEspada.scale.x = 5
	if Input.is_action_just_released("attack"):
		$Espada/CollShapEspada.scale.x = 1
	
	# ---------------- deslizar -----------------
	if Input.is_action_just_pressed("ui_down"):
		position.y += 50
	if Input.is_action_pressed("ui_down"):
		$CollisionShape2D.scale.y = 0.5
		$Dano/CollShapeDano.scale.y = 0.5
		$Espada/CollShapEspada.scale.y = 0.5
	if Input.is_action_just_released("ui_down"):
		position.y -=50
		$CollisionShape2D.scale.y = 1
		$Dano/CollShapeDano.scale.y = 1
		$Espada/CollShapEspada.scale.y = 1

func disparar_kunai():
	if ultimo_disparo <= 0:
		var kunai = pre_kunai.instance()
		var direcao
		if $Sprite.flip_h == false:
			direcao = 1
		else:
			direcao = -1
		kunai.set_pos_inicial(global_position, direcao)
		get_node("../").add_child(kunai)
		ultimo_disparo = intervalo

func _on_Dano_body_entered(body): #se colidir com algum inimigo
	get_node("Dano_animation").play("dano")
	$danofx.play()
	VIDA -= body.forca
	motion.y = JUMP
	pass


func _on_Sprite_animation_finished(): # controle de animaceos
	if $Sprite.animation == "kunai":
		animation_control = false
	elif $Sprite.animation == "jump":
		animation_control = false
	elif $Sprite.animation == "sword":
		animation_control = false
	
	elif $Sprite.animation == "die":
		get_tree().paused = true
		$Mortefx.play()
	pass 

func _on_Espada_body_entered(body): #dano da espada
	body.dano(50)
	pass 


func _on_Mortefx_finished():
	get_tree().change_scene("res://GameOver.tscn")
	pass 
