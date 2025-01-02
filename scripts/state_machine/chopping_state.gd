extends NodeState

var directionAnimMap : Dictionary = {
	Vector2.LEFT : 	{ 'animation' :  'chopping_left' , 'offset' : Vector2( -10 , 0 ) },
	Vector2.RIGHT : 	{  'animation' :  'chopping_right', 'offset' : Vector2( 10 ,0  ) },
	Vector2.DOWN : 	{ 'animation' :  'chopping_front', 'offset' : Vector2( 0  , 4 ) },
	Vector2.UP : 		{  'animation' :  'chopping_back' , 'offset' : Vector2( 0  , -20 ) } 
}

func _ready() -> void:
	hit_comp_collider.disabled = true
	hit_comp_collider.position = Vector2( 0 , 0 )

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	if( !anim_sprite.is_playing() ):
		transition.emit("IDLE")

func _on_enter() -> void:
	var direction = player.get_direction()

	hit_comp_collider.disabled = false
	hit_comp_collider.position = directionAnimMap[direction]['offset']

	anim_sprite.play( directionAnimMap[direction]['animation'] )
	await anim_sprite.animation_finished

func _on_exit():
	anim_sprite.stop()
	hit_comp_collider.disabled = true
	hit_comp_collider.position = Vector2.ZERO
	
