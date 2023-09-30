extends CharacterBody2D

@export var pressure = 100.0
@export var speed = 300

var player = null

var direction = Vector2.ZERO:
	set(value):
		direction = value

var destination = null:
	set(value):
		destination = value

func _physics_process(_delta):
	if destination != null:
		move_to_destination()
	
	move_and_slide()

func _process(delta):
	if player != null && is_instance_valid(player):
		var distance = global_position.distance_to(player.global_position)
		var anxiety = pressure / (distance / 10) if distance > 10 else pressure
		Global.add_anxiety(anxiety * delta)

func move_to_destination():
	var distance = global_position - destination
	var absolute_distance = distance.abs()
	
	if absolute_distance < Vector2(1, 1):
		velocity = Vector2.ZERO
		destination = null
		return
	
	self.direction = global_position.direction_to(destination)
	velocity = direction * speed
	

func _on_area_2d_body_entered(body):
	player = body

func _on_area_2d_body_exited(_body):
	player = null
