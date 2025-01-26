class_name Player
extends CharacterBody2D

var direction : Vector2 = Vector2.DOWN
@onready var hitComponent : HitComponent = $HitComponent
@export var current_tool : DataTypes.Tools = DataTypes.Tools.AXE_WOOD


func _ready() -> void:
	EventBusMain.ToolChanged.connect( _on_ToolChanged )

# Setters and Getters
func set_direction( vec : Vector2 ) -> void:
	direction = vec

func get_direction() -> Vector2:
	return direction
	
func get_current_tool() -> DataTypes.Tools:
	return current_tool
	
func set_current_tool( newTool : DataTypes.Tools ) -> void:
	current_tool = newTool
	hitComponent.setTool( newTool )

# Events
func _on_ToolChanged( newTool : DataTypes.Tools ) -> void:
	set_current_tool( newTool )
