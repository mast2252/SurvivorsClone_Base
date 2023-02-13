extends Area2D

@export var damage:int = 1

@onready var collision:CollisionShape2D = $CollisionShape2D
@onready var disableTimer:Timer = $DisableTimer

func tempDisable():
	collision.call_deferred("set","disabled", true)
	disableTimer.start()

func _on_disable_timer_timeout():
	collision.call_deferred("set","disabled", false)
