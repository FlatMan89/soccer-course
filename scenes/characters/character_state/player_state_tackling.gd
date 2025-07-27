class_name PlayerStateTackling
extends PlayerState

# 铲球后回复时间
const DURATION_PRIOR_RECOVERY := 200
# 铲球摩擦力
const GROUND_FRICTION := 250
# 铲球是否已完成
var is_trackle_complete := false
# 铲球完成时间
var time_finish_tackle := Time.get_ticks_msec()

func _enter_tree() -> void:
	animation_player.play("tackle")

func _process(delta: float) -> void:
	# 如何铲球未完成
	if not is_trackle_complete:
		# 将玩家的速度缓慢降为零
		player.velocity = player.velocity.move_toward(Vector2.ZERO, delta * GROUND_FRICTION)
		# 如果玩家铲球速度降为了零，标记铲球已完成并开始计时铲球结束到恢复的时间
		if player.velocity == Vector2.ZERO:
			is_trackle_complete = true
			time_finish_tackle = Time.get_ticks_msec()
	elif Time.get_ticks_msec() - time_finish_tackle > DURATION_PRIOR_RECOVERY:
		# 计时器到达铲球时间后进入恢复状态
		state_transition_requested.emit(Player.State.RECOVERING)
