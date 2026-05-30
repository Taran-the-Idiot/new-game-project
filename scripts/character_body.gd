extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -1000.0
var health = 10
var health_frames = 60
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 2

	# Handle jump.
	if Input.is_action_just_pressed("ui_w") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_a", "ui_d")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _process(delta: float) -> void:
	health_frames -= 1
	
	
	if health_frames < 0:
		for body in get_node("Area2D").get_overlapping_bodies():
			if body == get_parent().get_node("Enemy") or get_parent().get_node("Enemy2") or get_parent().get_node("Enemy3") or get_parent().get_node("Enemy4") or get_parent().get_node("Enemy5") or get_parent().get_node("Enemy6") or get_parent().get_node("Enemy7") or get_parent().get_node("Enemy8") or get_parent().get_node("Enemy9") or get_parent().get_node("Enemy10"):
				health -= 1
				health_frames = 60
			else:
				health = health
		print(health)
		print(get_node("Area2D").get_overlapping_bodies())
	else:
		pass
