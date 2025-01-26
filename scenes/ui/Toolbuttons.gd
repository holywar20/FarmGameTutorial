extends HBoxContainer

@onready var tool_pick: Button = $ToolPick
@onready var tool_water: Button = $ToolWater
@onready var tool_corn: Button = $ToolCorn
@onready var tool_tomato: Button = $ToolTomato
@onready var tool_axe : Button = $ToolAxe

func _on_tool_axe_pressed() -> void:
	EventBusMain.ToolChanged.emit( DataTypes.Tools.AXE_WOOD )

func _on_tool_pick_pressed() -> void:
	EventBusMain.ToolChanged.emit( DataTypes.Tools.TILL_GROUND )

func _on_tool_water_pressed() -> void:
	EventBusMain.ToolChanged.emit( DataTypes.Tools.WATER_CROPS )

func _on_tool_corn_pressed() -> void:
	EventBusMain.ToolChanged.emit( DataTypes.Tools.PLANT_CORN )

func _on_tool_tomato_pressed() -> void:
	EventBusMain.ToolChanged.emit( DataTypes.Tools.PLANT_TOMATO )

func _unhandled_input( event : InputEvent ) -> void:
	if( Input.is_action_just_pressed("release_tool") ):
		EventBusMain.ToolChanged.emit( DataTypes.Tools.NONE )
