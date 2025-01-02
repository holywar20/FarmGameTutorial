extends Area2D
class_name InteractableComponent

signal activated
signal deactivated

func _on_body_entered( body: Node2D ) -> void:
	activated.emit( body )

func _on_body_exited( body: Node2D ) -> void:
	deactivated.emit( body )
