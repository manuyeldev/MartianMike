extends CharacterBody2D

@export var gravity = 400
@export var jump_force = 250
@export var speed = 125

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
		if (velocity.y > 500):
			velocity.y = 500
		
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force	
		
	var direction = Input.get_axis("move_left", "move_right")
	print(direction)
	velocity.x = direction * speed
		
	move_and_slide()
	
