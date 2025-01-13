extends Sprite2D

@onready var health : HealthComponent = $Health
@onready var hurt: HurtComponent = $Hurt

const ROCK_SCENE = preload("res://scenes/pickables/stone.tscn")

func _on_hurt_on_hurt(dmg_amount: Variant) -> void:
	await get_tree().create_timer( 0.3 ).timeout
	material.set_shader_parameter('intensity' , 1.0 )
	await get_tree().create_timer( 0.3 ).timeout
	material.set_shader_parameter('intensity' , 0.0 )
	health.apply_damage( dmg_amount )

func _on_health_max_dmg_reached() -> void:
	call_deferred('add_log_scene')
	queue_free()
	
func add_rock_scene() -> void:
	var log_inst = ROCK_SCENE.instantiate() as Node2D
	log_inst.global_position = global_position
	get_parent().add_child( log_inst )

func _on_health_component_max_dmg_reached() -> void:
	call_deferred('add_rock_scene')
	queue_free()
