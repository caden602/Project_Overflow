extends Node2D

class_name GameTime

signal secondPassed

@export var player : Player

func _ready() -> void:
	player.manaChanged.connect(restart_clock)
	$GameTime.start()

func _on_game_time_timeout() -> void:
	secondPassed.emit()

func restart_clock() -> void:
	$GameTime.start()
