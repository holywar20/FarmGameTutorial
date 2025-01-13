extends CharacterBody2D 
class_name NPCRoot

@export var minWalkCycle : int = 0
@export var maxWalkCycle : int = 0 

var currWalkCycle : int = 0
var walkCycles : int = 1

func _ready() -> void:
	walkCycles = randi_range( minWalkCycle , maxWalkCycle )
