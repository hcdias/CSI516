extends ParallaxBackground

var speed = -3

func _ready():
	pass 

func _process(delta):
	$nuvens1.motion_offset.x += speed
	$nuvens2.motion_offset.x += speed*2
	pass
