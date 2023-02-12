extends CharacterBody2D

var movement_speed:float = 40.0
@onready var sprite:Sprite2D = $Sprite2D
@onready var walk_timer:Timer = get_node("%walkTimer")

func _physics_process(_delta):
	movement()
	
func movement():
	var  x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var  y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	if (x_mov != 0):
		sprite.flip_h = x_mov > 0
	var mov = Vector2(x_mov, y_mov).normalized()
	
	if (mov != Vector2.ZERO && walk_timer.is_stopped()):
		if sprite.frame >= sprite.hframes - 1:
			sprite.frame = 0
		else:
			sprite.frame +=1
		walk_timer.start()
	velocity = mov*movement_speed
	move_and_slide()
	
