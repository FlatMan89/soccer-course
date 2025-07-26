class_name Player
extends CharacterBody2D

enum ControlScheme { CPU, P1, P2 }

@export var control_scheme: ControlScheme
@export var speed: float = 80
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var sprite_2d: Sprite2D = %Sprite2D


var heading := Vector2.RIGHT


func _process(_delta: float) -> void:
	if control_scheme == ControlScheme.CPU:
		pass
	else:
		handle_human_movement()	
	
	set_movement_animation()
	set_heading()
	flip_sprites()
	
	move_and_slide()
	
	
func handle_human_movement() -> void:
	var directioin := KeyUtils.get_input_vector(control_scheme)
	velocity = directioin * speed
	
	
func set_movement_animation() -> void:
	if velocity.length() > 0:
		animation_player.play("run")
	else:
		animation_player.play("idle")
		
func set_heading() -> void:
	if velocity.x > 0:
		heading = Vector2.RIGHT
	elif velocity.x < 0:
		heading = Vector2.LEFT
		
func flip_sprites() -> void:
	if velocity.x > 0:
		sprite_2d.flip_h = false
	elif velocity.x < 0:
		sprite_2d.flip_h = true
