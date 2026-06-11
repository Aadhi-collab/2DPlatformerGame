extends CharacterBody2D
@onready var target=$"../Player"


var speed=150


func _physics_process(delta: float) -> void:
	var direction=(target.position-position).normaliized()
	velocity=direction*speed
	look_at(target.position)
	

	move_and_slide()
