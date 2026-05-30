extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -600.0
var direction := 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var Player_pos = get_parent().get_node("Player").global_position.x
	var Me_pos = self.global_position.x
	
	var collisions = get_node("fall").has_overlapping_bodies()

	
		
	if ((Player_pos - Me_pos)>0):
		direction = 1
		
	else: if ((Player_pos - Me_pos)<0):
		direction = -1
		if not collisions:
			direction = 0
	else:
		direction = 0
		
	var jump_col = get_node("Jump").has_overlapping_bodies()
	if jump_col and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
