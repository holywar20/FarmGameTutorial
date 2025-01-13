extends NodeState

@export var navAgent2D : NavigationAgent2D
@export var minSpeed : float = 5
@export var maxSpeed : float = 10

var speed : float = 10.0

const ERROR_NAV_AGENT = "ERROR_NAV_AGENT :: Error in %s :: typeId %s :: state %s - we are missing the navigation agent"

func _ready() -> void:
	assert( navAgent2D , ERROR_NAV_AGENT % [ getClass() , get_parent().typeId , name ] )
	
	call_deferred("charSetup")
	navAgent2D.velocity_computed.connect(_on_NavAgent2d_velocity_computed)

func charSetup() -> void:
	await get_tree().physics_frame
	
	setMoveTarget()

func setMoveTarget() -> void:
	navAgent2D.target_position = NavigationServer2D.map_get_random_point( navAgent2D.get_navigation_map() , navAgent2D.navigation_layers , false )
	speed = randf_range( minSpeed , maxSpeed )
	
	character.currWalkCycle += 1

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	if ( navAgent2D.is_navigation_finished() ):
		setMoveTarget()
		return
	
	var tPos : Vector2 = navAgent2D.get_next_path_position()
	var tDir : Vector2 = character.global_position.direction_to( tPos )
	
	var velocity = tDir * speed
	
	if( navAgent2D.avoidance_enabled ):
		animSprite.flip_h = velocity.x < 0
		navAgent2D.velocity = velocity
	else:
		character.velocity = velocity
		character.move_and_slide()

func _on_next_transitions() -> void:
	if( character.walkCycles == character.currWalkCycle ):
		character.velocity = Vector2.ZERO
		transition.emit("Idle")
		character.currWalkCycle = 0

func _on_enter() -> void:
	animSprite.play("walk")

func _on_exit() -> void:
	animSprite.stop()

# NavAgent Signals
func _on_NavAgent2d_velocity_computed( safe_velocity : Vector2 ) -> void:
	character.velocity = safe_velocity
	animSprite.flip_h = safe_velocity.x < 0
	character.move_and_slide()
