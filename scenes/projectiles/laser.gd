extends Area2D

@export var speed : float = 1000
var direction : Vector2
var mouse_direction: Vector2 = get_global_mouse_position()
var entered: bool

func _ready():
	entered = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * delta * speed

func _on_body_entered(body):
	entered = true
	if entered :
		print ("ouh")
