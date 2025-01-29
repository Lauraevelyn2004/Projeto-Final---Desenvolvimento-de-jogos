extends Button

func _on_pressed() -> void:
	# Troca para a cena de menu quando o botão é pressionado
	get_tree().change_scene_to_file("res://personagens/menu.tscn")
