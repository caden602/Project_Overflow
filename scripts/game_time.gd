extends Node2D

class_name GameTime

signal secondPassed

func _ready() -> void:
	$GameTime.start()

func _on_game_time_timeout() -> void:
	secondPassed.emit()
