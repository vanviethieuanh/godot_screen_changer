extends ColorRect

signal scene_changed
@export var next_scene: String;

var tween: Tween;

func In(duration:float):
	self.material.set_shader_parameter("position", -1.5)
	self.material.set_shader_parameter("in_out", 0)
	
	tween = self.create_tween()
	tween.tween_method(SetShaderPosition, -1.5, 1, duration)
	tween.finished

func Out(duration:float):
	self.material.set_shader_parameter("position", 1)
	self.material.set_shader_parameter("in_out", 1)
	
	tween = self.create_tween()
	tween.tween_method(SetShaderPosition, 1, -1.5, duration)
	tween.finished
	
	await get_tree().create_timer(duration).timeout
	assert(get_tree().change_scene_to_file(next_scene) == OK)
	emit_signal("scene_changed")

func SetShaderPosition(value: float):
	self.material.set("shader_parameter/position", value)
