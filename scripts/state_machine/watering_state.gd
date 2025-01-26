extends NodeState

var directionAnimMap : Dictionary = {
	Vector2.LEFT : 'watering_left',
	Vector2.RIGHT : 'watering_right',
	Vector2.DOWN : 'watering_front',
	Vector2.UP : 'watering_back' 
}

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	if( !animSprite.is_playing() ):
		transition.emit("Idle")

func _on_enter() -> void:
	var direction = character.get_direction()
	
	animSprite.play( directionAnimMap[direction] )
