class_name BallState
extends Node

signal state_transition_requested(new_state: BallState)

var carrer: Player = null
var ball: Ball = null
var player_detection_area: Area2D = null

func setup(context_ball: Ball, content_player_detection_area: Area2D, context_carrer: Player) -> void:
	ball = context_ball
	player_detection_area = content_player_detection_area
	carrer = context_carrer
