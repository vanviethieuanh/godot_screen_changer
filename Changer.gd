extends ColorRect

signal scene_changed
export(String, FILE, "*.tscn") var next_scene;

func In(duration:float):
	self.material.set_shader_param("position", -1.5)
	self.material.set_shader_param("in_out", 0)
	$Tween.interpolate_property(self.material, "shader_param/position", -1.5, 1, duration, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Tween.start()
	
func Out(duration:float):
	self.material.set_shader_param("position", 1)
	self.material.set_shader_param("in_out", 1)
	$Tween.interpolate_property(self.material, "shader_param/position", 1, -1.5, duration, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$Tween.start()
	
	yield(get_tree().create_timer(duration), "timeout")
	assert(get_tree().change_scene(next_scene) == OK)
	emit_signal("scene_changed")
	
