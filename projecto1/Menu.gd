extends Control

func _ready():
	$menufx.play()

func _on_StartButton_pressed():
	$menufx.stop()
	get_tree().change_scene("res://level0.tscn")

func _on_IntroButton_button_down():
	get_tree().change_scene("res://Intro1.tscn")
	pass 
	
func _on_QuitButton_pressed():
	get_tree().quit()


