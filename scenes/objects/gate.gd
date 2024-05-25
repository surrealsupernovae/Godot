extends StaticBody2D

signal playerin(body)

func _on_front_area_body_entered(body):
	playerin.emit(body)

