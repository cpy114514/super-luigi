extends CharacterBody2D

var coins = 0

const SPEED = 200.0
const JUMP_VELOCITY = -430.0

@onready var coin_label = $"../CanvasLayer/Panel/Label"

func add_coin():
	coins += 1
	coin_label.text = "*" + str(coins)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_coinblock_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
