extends Area2D
class_name HitComponent

@export var tool : DataTypes.Tools = DataTypes.Tools.NONE
@export var dmg : int = 1

func get_tool() -> DataTypes.Tools:
	return tool

func setTool( nTool : DataTypes.Tools ) -> void:
	tool = nTool

func get_dmg() -> int:
	return dmg
