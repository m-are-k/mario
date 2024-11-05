extends Node2D
@onready var prawo: RayCast2D = $Prawo
@onready var lewo: RayCast2D = $Lewo
@onready var zuk: AnimatedSprite2D = $AnimatedSprite2D
const speed = 60
var direction = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if prawo.is_colliding():
		direction = -1
		zuk.flip_h = false
	if lewo.is_colliding():
		direction = 1
		zuk.flip_h = true
	position.x += direction * speed * delta
