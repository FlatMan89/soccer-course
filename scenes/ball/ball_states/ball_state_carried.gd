class_name BallStateCarried
extends BallState


func _enter_tree() -> void:
	assert(carrer != null)
	
	
func _process(delta: float) -> void:
	ball.position = carrer.position
