extends Node2D
@export var player_controller: Playercontroller
@export var animation_player: AnimationPlayer
@export var sprite:Sprite2D
@onready var coin: AnimatedSprite2D = $"../../CharacterBody2D/Coin"

func _process(delta):
	coin.play("coin")
	
	if player_controller.direction==1:
		sprite.flip_h=false
	elif player_controller.direction==-1:
		sprite.flip_h=true
	if abs(player_controller.velocity.x)>0:
		animation_player.play("Movement")

	if player_controller.velocity.y <0:
		animation_player.play("jump")
	elif player_controller.velocity.y >0:
		animation_player.play("fall")

	
