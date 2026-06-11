extends CharacterBody2D
@export var move_speed:float =150.0

@onready var player: Node2D = $"../Player"

func _physics_process(delta: float) -> void:
	var direction=position.direction_to(player.global_position).normalized()
	velocity=direction*move_speed
	move_and_slide()
