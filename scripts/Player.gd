extends CharacterBody2D

@onready var ui = $"../Ui"


const SPEED = 300.0
@export_range(0, 1000, 1.0) var jump_velocity: int = 800


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("p1_jump") and is_on_floor():
		velocity.y = -jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("p1_left", "p1_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_pickable_area_entered(area):
	print("dupa")
	ui.color = Color(1,1,1,1)
	#pass # Replace with function body.aa
