extends NodeState

var direction : Vector2
var directionAnimMap : Dictionary = {
	Vector2.LEFT : 'idle_left',
	Vector2.RIGHT : 'idle_right',
	Vector2.DOWN : 'idle_front',
	Vector2.UP : 'idle_back' 
}

# This table reflects valid transitions from idle to some other state
var toolTransitionMap : Dictionary = {
	DataTypes.Tools.AXE_WOOD : "Chopping",
	DataTypes.Tools.TILL_GROUND : "Tilling",
	DataTypes.Tools.WATER_CROPS : "Watering"
}

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	direction = GameInputEvents.movement_input()
		
	if( direction != Vector2.ZERO ):
		character.set_direction( direction )
	else:
		direction = character.get_direction()
		
	animSprite.play( directionAnimMap[direction] )

func _on_next_transitions() -> void:
	if( GameInputEvents.is_movement_input() ):
		transition.emit("Walk")
	
	var tool = character.get_current_tool()
	if( GameInputEvents.is_using_tool() ):
		if( toolTransitionMap.has( tool ) ):
			transition.emit( toolTransitionMap[tool] )

func _on_enter() -> void:
	pass
