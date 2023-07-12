extends Node2D

func _ready():
	$CanvasLayer/Changer.In(1.5)

func _process(delta):
	if Input.is_action_pressed("change"):
		$CanvasLayer/Changer.Out(2.0)
