extends Line2D

@onready var parent = get_parent()

@export var length = 30

func _ready():
	set_as_top_level(true)
	clear_points()
	
func _physics_process(delta: float) -> void:
	add_point(parent.global_position)
	
	if points.size() > length:
		remove_point(0)
