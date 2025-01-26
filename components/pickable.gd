extends Area2D
class_name Pickable

@export var c_name : String

func _on_body_entered( body : Node2D ) -> void:
	if body is Player:
		get_parent().queue_free()
		print("picked up" , c_name )
