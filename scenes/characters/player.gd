class_name Player
extends CharacterBody2D

enum ControlScheme { CPU, P1, P2 }
# 玩家状态 移动，铲球，恢复，准备射门，射门
enum State { MOVING, TACKLING, RECOVERING, PREPPING_SHOT, SHOOTING }

@export var control_scheme: ControlScheme
@export var speed: float = 80
@export var power: float
@export var ball: Ball

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var sprite_2d: Sprite2D = %Sprite2D


var current_state: PlayerState = null
var heading := Vector2.RIGHT
var state_factory := PlayerStateFactory.new()

func _ready() -> void:
	switch_state(State.MOVING)

func _process(_delta: float) -> void:
	flip_sprites()
	
func _physics_process(_delta: float) -> void:
	move_and_slide()
	
func switch_state(state: State) -> void:
	if current_state != null:
		current_state.queue_free()
		
	current_state = state_factory.get_fresh_state(state)
	current_state.setup(self, animation_player)
	current_state.state_transition_requested.connect(switch_state.bind())
	current_state.name = "PlayerStateMaching: " + str(state)
	call_deferred("add_child", current_state)
	
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
		
func has_ball() -> bool:
	return ball.carrer == self
