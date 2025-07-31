class_name BallStateFactory

var states: Dictionary

func _init() -> void:
	states = {
		Ball.State.CARRIED: BallStateCarried, # 被携带状态
		Ball.State.FREEFORM: BallStateFreeForm, # 自由状态
		Ball.State.SHOT: BallStateShot, # 射门状态
	}
	
func get_fresh_state(state: Ball.State) -> BallState:
	assert(states.has(state), "状态不存在")
	return states.get(state).new()
