extends Area2D

@export_enum("Cooldown", "HitOnce","DisableHitBox") var HurtBoxType = 0

@onready var collision:CollisionShape2D = $CollisionShape2D
@onready var disable_timer:Timer = $DisableTimer

signal hurt(damage)

func _on_area_entered(area):
	if area.is_in_group("attacks"):
		if not area.get("damage") == null:
			match HurtBoxType:
				0: # Collision
					collision.call_deferred("set","disabled", true)
					disable_timer.start()
				1: # hit once
					pass
				2: # disable hitbox
					if area.has_method("tempDisable"):
						area.tempDisable()
			var damage = area.damage
			emit_signal("hurt", damage)


func _on_disable_timer_timeout():
	collision.call_deferred("set","disabled", false)
