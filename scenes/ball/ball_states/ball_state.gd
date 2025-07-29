class_name BallState
extends Node

signal state_transition_requested(new_state: Ball.State)

var carrer: Player = null
var ball: Ball = null
var player_detection_area: Area2D = null
var animation_player: AnimationPlayer = null

func setup(context_ball: Ball, content_player_detection_area: Area2D, context_carrer: Player, context_animation_player: AnimationPlayer) -> void:
	ball = context_ball
	player_detection_area = content_player_detection_area
	carrer = context_carrer
	animation_player = context_animation_player
