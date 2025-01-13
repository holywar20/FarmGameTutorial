extends NodeState

@export var idleTime : float = 5.0
@onready var idleStateTimer : Timer = Timer.new()
var idleStateTimeout : bool = false

func _ready() -> void:
	idleStateTimer.wait_time = idleTime
	idleStateTimer.timeout.connect( _on_idle_state_timeout )
	add_child( idleStateTimer )
	
	idleStateTimer.start()

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	if( idleStateTimeout ):
		transition.emit("Walk")
		idleStateTimer.start()

func _on_enter() -> void:
	animSprite.play("idle")
	idleStateTimeout = false

func _on_exit() -> void:
	animSprite.stop()
	idleStateTimer.stop()

# Events
func _on_idle_state_timeout() -> void:
	idleStateTimeout = true
