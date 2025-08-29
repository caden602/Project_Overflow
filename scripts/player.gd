extends CharacterBody2D

class_name Player

signal manaChanged

@export var maxMana = 100.0
@export var currentMana: int = maxMana
@export var gameTime : GameTime

const SPEED = 130.0

func _ready() -> void:
	gameTime.secondPassed.connect(increaseMana)

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("ui_left", "ui_right")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var y_direction := Input.get_axis("ui_up", "ui_down")
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_select"):
		useMana()

func useMana():
	currentMana = currentMana - 10
	manaChanged.emit()
	
func increaseMana():
	currentMana = min(currentMana + 10, 100)
