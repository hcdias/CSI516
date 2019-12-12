extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#$AcceptDialog.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

		
func _on_Node2D_body_entered(body):
	if body.name == "KinematicBody2D":
		$CanvasLayer/AcceptDialog.popup()
		print_debug('teste')
		
	pass # Replace with function body.


func _on_AcceptDialog_confirmed():
	get_tree().change_scene("res://LevelFinal.tscn")
	pass # Replace with function body.
