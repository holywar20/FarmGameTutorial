class_name NodeState
extends Node

@export var player : Player
@export var anim_sprite : AnimatedSprite2D
@export var hit_comp_collider : CollisionShape2D

@warning_ignore("unused_signal")
signal transition 

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	pass

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	anim_sprite.stop()
