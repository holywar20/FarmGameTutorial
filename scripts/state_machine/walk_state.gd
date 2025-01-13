extends NodeState

@export var speed : int = 50

var directionAnimMap : Dictionary = {
	Vector2.LEFT : 'walk_left',
	Vector2.RIGHT : 'walk_right',
	Vector2.DOWN : 'walk_front',
	Vector2.UP : 'walk_back' 
}

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	var direction : Vector2 = GameInputEvents.movement_input()
	
	if( direction != Vector2.ZERO ):
		animSprite.play( directionAnimMap[direction] )
		character.set_direction( direction )
		
	character.velocity = direction * speed
	character.move_and_slide()

func _on_next_transitions() -> void:
	if( !GameInputEvents.is_movement_input() ):
		transition.emit("Idle")

func _on_enter() -> void:
	pass
