extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser(pos, direction)
signal grenade(pos, direction)

func _process(_delta):

	var mov = Input.get_vector("left", "right", "up", "down")
	velocity = mov * 500
	move_and_slide()
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position()- position).normalized()

	if Input.is_action_pressed("primary") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		laser.emit(selected_laser.global_position, player_direction)
		$LaserTime.start()
		can_laser = false


	if Input.is_action_pressed("secondary") and can_grenade:
		var grenade_markers = $GrenadeStartPosition.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		grenade.emit(selected_grenade.global_position, player_direction)
		$GrenadeTime.start()
		can_grenade = false

func _on_grenade_time_timeout():
	can_grenade = true

func _on_laser_time_timeout():
	can_laser = true
