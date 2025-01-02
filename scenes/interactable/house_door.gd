extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var door_activator: InteractableComponent = $DoorActivator
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	door_activator.connect("activated" , _on_door_activator_activated )
	door_activator.connect("deactivated" , _on_door_activator_deactivated )

func _on_door_activator_activated( _node : Node ) -> void:
	animated_sprite_2d.play("open_door")
	collision_shape_2d.set_deferred( 'disabled' , true )
	
func _on_door_activator_deactivated( _node: Node ) -> void:
	animated_sprite_2d.play("close_door")
	collision_shape_2d.set_deferred( 'enabled' , true  )
