extends Button

# Caminho para a fase 4
const FASE_1_PATH = "res://levels/fase_06.tscn"

func _ready() -> void:
	# Conecta o sinal "pressed" ao método que troca de cena
	self.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	# Troca para a fase 6
	var result = get_tree().change_scene_to_file(FASE_1_PATH)
	Global.moedas = 0
	print("Moedas resetadas para:", Global.moedas)
	if result != OK:
		print("Erro ao carregar a fase 6:", FASE_1_PATH)
