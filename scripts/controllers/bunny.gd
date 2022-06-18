extends CharacterBody2D

const GRAVITY = 600.0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var planet : StaticBody2D
var horizontal_movement : float
var vertical_movement : float
var currentVelocity : Vector2

func _physics_process(delta):
	for closestPlanet in get_tree().get_nodes_in_group("Planets"):
		planet = closestPlanet
	
	var dir = global_position.direction_to(planet.global_position)
	
	# Add the gravity.
	velocity += GRAVITY * dir
	
	rotate_player(delta)
	
	move_and_slide()

func rotate_player(delta):
	global_rotation = lerp_angle(global_rotation, (planet.global_position - global_position).angle() - deg2rad(90), delta * 3)

func get_gravity_dir_vector():
	return (planet.transform.origin - transform.origin).normalized()
