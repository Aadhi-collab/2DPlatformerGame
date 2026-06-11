extends CharacterBody2D

class_name Playercontroller
@export var speed=10.0
@export var jump_power=10.0
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"

var speed_multiplayer=30.0
var jump_multiplayer=-30.0
var direction=0
#const SPEED = 100.0
#const JUMP_VELOCITY = -200.0
var jump_max=2
var jump_count=0
var ability_max=3
var ability_count=0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		get_tree().reload_current_scene()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		jump_count=0
		ability_count=0
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and jump_count<jump_max and  ability_count<ability_max :
		velocity.y = jump_power*jump_multiplayer
		jump_count+=1
	if Input.is_action_just_pressed("Up") and ability_count<ability_max:
		velocity.y=jump_multiplayer*jump_power
		ability_count+=1
	if( (jump_count+ability_count)==5):
		audio_stream_player_2d.play()
		
		


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction*speed*speed_multiplayer
	else:
		velocity.x = move_toward(velocity.x, 0, speed*speed_multiplayer)

	move_and_slide()
	
#restart the game
