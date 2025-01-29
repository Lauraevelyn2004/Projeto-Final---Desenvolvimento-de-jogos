extends Node2D  # A cena é do tipo Node2D

# Variáveis para os botões
var equipar1: Button
var equipar2: Button
var play_button: Button
var voltar_button: Button

# Constantes de skins
const SKINS = {
	"jogador": preload("res://personagens/jogador.tscn"),
	"skin1": preload("res://personagens/skin/skin_01.tscn")
}

func _ready() -> void:
	# Acessar os nós diretamente
	equipar1 = $Loja/equipar1 as Button
	equipar2 = $Loja/equipar2 as Button
	play_button = $Loja/PLAY as Button
	voltar_button = $Loja/VOLTAR as Button

	# Verifique se os botões foram encontrados corretamente
	if not equipar1 or not equipar2 or not play_button or not voltar_button:
		print("Erro: Um ou mais botões não foram encontrados!")
		return

	# Conectar os sinais manualmente usando signal_connect
	equipar1.signal_connect("pressed", self, "on_equipar1_pressed")
	equipar2.signal_connect("pressed", self, "on_equipar2_pressed")
	play_button.signal_connect("pressed", self, "on_play_pressed")
	voltar_button.signal_connect("pressed", self, "on_voltar_pressed")

	print("Botões conectados com sucesso.")

# Funções de manipulação de botões
func on_equipar1_pressed() -> void:
	Global.set_skin("jogador")  # Atualiza a skin global
	print("Skin equiparada: Jogador")

func on_equipar2_pressed() -> void:
	Global.set_skin("skin1")  # Atualiza a skin global
	print("Skin equiparada: Skin 1")

func on_play_pressed() -> void:
	print("Iniciando a Fase 01 com a skin: %s" % Global.get_skin())
	get_tree().change_scene("res://levels/fase_01.tscn")  # Muda para a fase 01

func on_voltar_pressed() -> void:
	print("Voltando para o Menu...")
	get_tree().change_scene("res://personagens/menu.tscn")  # Volta para o menu
