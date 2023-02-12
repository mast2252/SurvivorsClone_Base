extends CharacterBody2D

@export var movement_speed:float = 20.0

@onready var player:CharacterBody2D = get_tree().get_first_node_in_group("players");

func _physics_process(_delta):
	
	$Sprite2D.flip_h = player.global_position.x > global_position.x

	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed;
	move_and_slide()
