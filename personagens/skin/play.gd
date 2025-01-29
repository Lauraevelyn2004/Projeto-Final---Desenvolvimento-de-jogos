extends Button

func _on_pressed() -> void:
	# Troca para a cena especificada no Godot 4.x
	get_tree().change_scene_to_file("res://levels/fase_01.tscn")
