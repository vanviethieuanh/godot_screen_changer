extends Node2D

func _process(delta):
	if Input.is_action_pressed("change"):
		$CanvasLayer/Changer.Out(2.0)
