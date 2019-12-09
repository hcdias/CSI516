extends Control

func _ready():
	get_tree().paused = false
	$GameOvfx.play()

func _on_Button_pressed():
	$GameOvfx.stop()
	get_tree().change_scene("res://Menu.tscn")
	pass 
