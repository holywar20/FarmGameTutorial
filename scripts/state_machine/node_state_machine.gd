class_name NodeStateMachine
extends Node

@export var initial_node_state : NodeState
@export var typeId : String = "NOT_DEFINED"
@export var isDebug : bool = false

var node_states : Dictionary = {}
var current_node_state : NodeState
var current_node_state_name : String

const SETUP_BAD_IDENTIFIER = "Object needs an identifier, really just for debug , but for your own good - give it a damn name"
const SETUP_BAD_INIT_STATE = "Object of %s does not have a valid start node"
const BAD_STATE = "Object of %s has received an invalid state of %s"

func _ready() -> void:
	# This automatically hooks up the transitions at run time.
	for child in get_children():
		if child is NodeState:
			node_states[child.name] = child
			child.transition.connect(transition_to)
	
	if initial_node_state:
		initial_node_state._on_enter()
		current_node_state = initial_node_state
		current_node_state_name = current_node_state.name
		
	# Some asserts to make life easy
	assert( typeId != "NOT_DEFINED" , SETUP_BAD_IDENTIFIER )
	assert( initial_node_state , SETUP_BAD_INIT_STATE % [ typeId ] )

func _process(delta : float) -> void:
	if current_node_state:
		current_node_state._on_process(delta)

func _physics_process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_physics_process(delta)
		current_node_state._on_next_transitions()

func transition_to(node_state_name : String) -> void:
	if( isDebug ):
		print("transitioned to " , node_state_name , current_node_state )

	if node_state_name == current_node_state.name:
		return
	
	assert( node_states[node_state_name] , BAD_STATE % [ get_parent().name , node_state_name ] )
	var new_node_state = node_states.get(node_state_name)
	
	if current_node_state:
		current_node_state._on_exit()
	
	new_node_state._on_enter()
	
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name
	if( isDebug ):
		print( "State Change ", current_node_state_name )
