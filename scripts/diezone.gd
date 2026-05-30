extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.has_overlapping_bodies():
		get_parent().get_node("Player/Camera2D/LOSE").visible = true
	pass
