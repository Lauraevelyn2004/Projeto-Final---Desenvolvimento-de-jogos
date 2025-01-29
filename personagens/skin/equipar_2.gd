extends Button  # O script herda de Button, já que o botão "Equipar2" é um Button

func _on_pressed() -> void:
	# Troca para a cena especificada no Godot 4.x
	get_tree().change_scene_to_file("res://personagens/skin/skin_01.tscn")
