extends Sprite2D


@onready var health : HealthComponent = $Health
@onready var hurt: HurtComponent = $Hurt

const LOG_SCENE = preload("res://scenes/pickables/log.tscn")

func _on_hurt_on_hurt(dmg_amount: Variant) -> void:
	health.apply_damage( dmg_amount )
	material.set_shader_parameter('intensity' , 0.5 )
	print( material.get_shader_parameter('intensity') )
	await get_tree().create_timer( 0.5 ).timeout
	material.set_shader_parameter('intensity' , 0.0 )

func _on_health_max_dmg_reached() -> void:
	call_deferred('add_log_scene')
	queue_free()
	
func add_log_scene() -> void:
	var log_inst = LOG_SCENE.instantiate() as Node2D
	log_inst.global_position = global_position
	get_parent().add_child( log_inst )
