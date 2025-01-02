class_name Player
extends CharacterBody2D

var direction : Vector2 = Vector2.DOWN

@export var current_tool : DataTypes.Tools = DataTypes.Tools.AXE_WOOD

# Setters and Getters
func set_direction( vec : Vector2 ) -> void:
	direction = vec

func get_direction() -> Vector2:
	return direction
	
func get_current_tool() -> DataTypes.Tools:
	return current_tool
	
func set_current_tool( new_tool : DataTypes.Tools ) -> void:
	current_tool = new_tool
