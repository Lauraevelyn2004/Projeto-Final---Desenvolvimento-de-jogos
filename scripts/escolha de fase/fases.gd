extends Button

# Caminho da cena do menu de escolha de fases
const MENU_ESCOLHA_FASES = "res://personagens/escolha_fases.tscn"

func _ready() -> void:
	# Conecta o sinal "pressed" ao método de troca de cena usando Callable
	self.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	# Troca para a cena de escolha de fases
	var result = get_tree().change_scene_to_file(MENU_ESCOLHA_FASES)
	
	if result != OK:
		print("Erro ao carregar a cena de escolha de fases:", MENU_ESCOLHA_FASES)
