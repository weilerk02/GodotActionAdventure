extends CharacterBody2D
class_name Player

@export var move_speed: float = 100
@export var push_strength: float = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	position = SceneManager.player_spawn_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = move_vector * move_speed
	
	if velocity.x > 0:
		$AnimatedSprite2D.play("move_right")
	
	elif velocity.x < 0:
		$AnimatedSprite2D.play("move_left")
		
	elif velocity.y >0:
		$AnimatedSprite2D.play("move_down")
		
	elif velocity.y <0:
		$AnimatedSprite2D.play("move_up")
		
	else:
		$AnimatedSprite2D.stop()
		
		
	var collision: KinematicCollision2D = get_last_slide_collision()
	if collision: 
		
		var collider_node = collision.get_collider()
		
		if collider_node is RigidBody2D:
			var collision_normal: Vector2 = collision.get_normal()
			
			collider_node.apply_central_force(-collision_normal * push_strength)
		
	move_and_slide()
	 
