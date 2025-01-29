extends Button

func _on_pressed() -> void:
	Global.moedas = 0
	print("Moedas resetadas para:", Global.moedas)
	get_tree().change_scene_to_file("res://levels/fase_01.tscn")
