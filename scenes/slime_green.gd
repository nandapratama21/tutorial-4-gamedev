extends CharacterBody2D

@export var speed = 50
@export var direction = -1  # -1 is left, 1 is right
@export var detect_cliffs = false
@export var direction_change_cooldown = 2.0


var is_dead = false
var gravity = 1200
var can_change_direction = true
var change_direction_timer = 0.0



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("move")
	
	
	scale.x = direction
	if direction == -1:
		$AnimatedSprite2D.flip_h = true


func _physics_process(delta):
	
	if $FloorChecker.is_colliding() and $FloorChecker2.is_colliding():
		detect_cliffs = false
	else:
		detect_cliffs = true
	
	
	if is_dead:
		return
		
	if not can_change_direction:
		change_direction_timer += delta
		if change_direction_timer >= direction_change_cooldown:
			can_change_direction = true
			change_direction_timer = 0.0
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	velocity.x = speed * direction
	
	if detect_cliffs and is_on_floor() and can_change_direction:
		if not $FloorChecker.is_colliding() or not $FloorChecker2.is_colliding():
			direction *= -1
			$AnimatedSprite2D.flip_h = (direction == -1)
			can_change_direction = false
			change_direction_timer = 0.0
			
			
			
	move_and_slide()
	
	if is_on_wall():
		direction *= -1
		$AnimatedSprite2D.flip_h = (direction == -1)
		
		
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.name == "Player":
			# Check if player is hitting from above (slightly higher position than center)
			if collision.get_position().y - 10 < global_position.y:
				die()
			else:
				get_tree().change_scene_to_file("res://scenes/LoseScreen.tscn")
				
func die():
	is_dead = true
	velocity = Vector2.ZERO
	$AnimatedSprite2D.play("dead")
	$CollisionPolygon2D.set_deferred("disabled", true)
	# Wait a moment then remove from scene
	await get_tree().create_timer(0.5).timeout
	queue_free()
