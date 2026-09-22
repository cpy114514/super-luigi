extends Area2D

var used = false

func _on_body_entered(body):
	if body.is_in_group("player") and not used:
		used = true
		body.add_coin()
