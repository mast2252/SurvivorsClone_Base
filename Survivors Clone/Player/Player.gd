extends CharacterBody2D

var movement_speed:float = 40.0*60.0

func _process(delta):
	pass
	
func _physics_process(_delta):
	movement(_delta)
	pass
	
func movement(_delta):
	var  x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var  y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov).normalized()
	velocity = mov*movement_speed*_delta
	move_and_slide()
	
