extends Area2D

var angle : float
var speed : float
var lifetime : float

func _physics_process(delta: float) -> void:
    if lifetime <= 0:
        queue_free()
    position += Vector2.LEFT.rotated(angle) * speed * delta
    lifetime -= delta
