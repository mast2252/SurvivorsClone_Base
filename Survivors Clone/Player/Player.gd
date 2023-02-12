extends CharacterBody2D

var movement_speed:float = 40.0

func _process(delta):
	pass
	
func _physics_process(_delta):
	movement()
	
func movement():
	var  x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var  y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov).normalized()
	velocity = mov*movement_speed
	move_and_slide()
	
