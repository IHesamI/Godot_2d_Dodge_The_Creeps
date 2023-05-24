extends RigidBody2D

@export var min_speed=150.0
@export var max_speed=250.0

func _ready():
	var mob_types=$AnimatedSprite2D.sprite_frames.get_animation_names()
	var animation_type=mob_types[randi()%mob_types.size()]
	$AnimatedSprite2D.play(animation_type)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
