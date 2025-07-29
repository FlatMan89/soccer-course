class_name BallStateCarried
extends BallState

const OFFSET_FROM_PLAYER: Vector2 = Vector2(10, 4) 
const DRIBBLE_FREQUENCY := 10.0
const DRIBBLE_INTENSITY := 3.0

var dribble_time := 0.0

func _enter_tree() -> void:
	assert(carrer != null)
	
	
func _process(delta: float) -> void:
	
	var vx := 0.0
	dribble_time += delta
	
	if carrer.velocity != Vector2.ZERO:
		
		if carrer.velocity.x != 0:
			vx = cos(dribble_time * DRIBBLE_FREQUENCY) * DRIBBLE_INTENSITY
		
		if carrer.heading.x >= 0:
			animation_player.play("roll")
			animation_player.advance(0)
		else:
			animation_player.play_backwards("roll")
			animation_player.advance(0)
	else:
		animation_player.play("idle")
		
	ball.position = carrer.position + Vector2(vx + carrer.heading.x * OFFSET_FROM_PLAYER.x, OFFSET_FROM_PLAYER.y)
		
