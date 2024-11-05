extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("u died")
	Engine.time_scale = 0.25
	timer.start()
	body.get_node("CollisionShape2D").queue_free()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
