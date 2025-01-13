class_name NodeState
extends Node

@export var character : CharacterBody2D
@export var animSprite : AnimatedSprite2D
@export var hit_comp_collider : CollisionShape2D

@warning_ignore("unused_signal")
signal transition

const ERROR_CHAR_ROOT_MISSING = "We are missing CharacterBody2D for a NodeState script for %s - state %s" 
const ERROR_ANIM_SPRITE_MISSING = "We are missing AnimationSprite2D for a nodeState %s for typeId %s - state %s"
const ERROR_COLLIDER_MISSING = "We are missing CollisionShape2D for a state %s for typeId %s - state %s"

func getClass() -> String:
	return "NodeState"

func _ready() -> void:
	assert( character , ERROR_CHAR_ROOT_MISSING % [ getClass() , name ] )
	assert( animSprite , ERROR_ANIM_SPRITE_MISSING % [ getClass() , get_parent().typeId , name ] )
	assert( hit_comp_collider , ERROR_COLLIDER_MISSING % [ getClass() , get_parent().typeId , name ] )

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	pass

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass
