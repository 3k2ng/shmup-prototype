extends Area2D

@export var movement_speed : float = 512
@export var focus_multiplier : float = .6

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
