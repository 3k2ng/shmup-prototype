extends Area2D

const movement_speed : float = 512
const focus_multiplier : float = .6

const bullet_prefab : PackedScene = preload("res://objects/player/player_bullet.tscn")
const shoot_cooldown : float = .06

@onready var shoot_timer : float = 0.

func _process(delta: float) -> void:
    var shoot_normal : bool = Input.is_action_pressed("shoot_rapid")
    var shoot_focus : bool = Input.is_action_pressed("shoot_focus")
    if shoot_timer > 0:
        shoot_timer -= delta
    elif shoot_normal or shoot_focus:
        var new_bullet = bullet_prefab.instantiate()
        new_bullet.position = position + Vector2.UP * 32
        new_bullet.angle = PI / 2
        new_bullet.speed = 1024
        new_bullet.lifetime = 2.
        get_parent().add_child(new_bullet)
        shoot_timer = shoot_cooldown

func _physics_process(delta: float) -> void:
    var movement_direction = Input.get_vector(
        "move_left",
        "move_right",
        "move_up",
        "move_down",
    )
    var focused : bool = Input.is_action_pressed("shoot_focus")
    position += movement_direction * movement_speed * delta * (focus_multiplier if focused else 1.)
    const width : float = 640
    const height : float = 480
    position.x = clamp(position.x, -width / 2., width / 2.)
    position.y = clamp(position.y, -height / 2., height / 2.)
