extends KinematicBody2D

var velocity = Vector2.ZERO

var rotationSpeed = 7.5
var speed = 0.1
var maxSpeed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
	position += velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0, maxSpeed)
	$Exhaust.hide()
	
	if Input.is_action_pressed("forward"):
		velocity = velocity + Vector2(0,-speed).rotated(rotation)
		$Exhaust.show()
	
	if Input.is_action_pressed("left"):
		rotation_degrees += -rotationSpeed
	
	if Input.is_action_pressed("right"):
		rotation_degrees += rotationSpeed
	
	position.x = wrapf(position.x, 0, 1024)
	position.y = wrapf(position.y, 0, 600)
