extends Control

func _ready():
	$Controles.popup()

func _on_Button_button_down():
	get_tree().change_scene("res://Intro2.tscn")
	pass 
