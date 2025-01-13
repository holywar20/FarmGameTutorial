class_name HurtComponent
extends Area2D

@export var tool : DataTypes.Tools = DataTypes.Tools.NONE

signal on_hurt( dmg_amount )

func _on_area_entered( area: HitComponent ) -> void:
	print("Hitting")
	if( tool == area.get_tool() ):
		on_hurt.emit( area.get_dmg() )
