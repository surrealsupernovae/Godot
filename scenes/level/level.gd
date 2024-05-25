extends Node2D

var laser_scene : PackedScene = preload ("res://scenes/projectiles/laser.tscn")
var grenade_scene : PackedScene = preload ("res://scenes/projectiles/grenade.tscn")

func _process(delta):
	var laser = laser_scene.instantiate()
	print(laser.entered)
	if laser.entered :
		$Projectiles.remove_child(laser)


func _on_area_2d_body_entered(_body):
	print("body")

func _on_area_2d_body_exited(_body):
	print("exit")

func _on_gate_playerin(body):
	print("player detected in gate")
	print(body)

func _on_player_laser(pos, player_direction):
	var laser = laser_scene.instantiate()
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(player_direction.angle()) + 90
	laser.direction = player_direction
	print("laser:", pos)
	$Projectiles.add_child(laser)

func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity= direction * grenade.speed
	$Projectiles.add_child(grenade)
	print("grenade: ", pos)


