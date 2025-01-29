extends Node2D

@onready var camera = $camera as Camera2D


# Definindo o mapeamento das skins
const SKINS = {
	"jogador": preload("res://personagens/jogador.tscn"),
	"skin1": preload("res://personagens/skin/skin_01.tscn")
}

func _ready() -> void:
	# Obter a skin selecionada da variável global
	var skin_selecionada = Global.skin_selecionada  # Obter a skin selecionada globalmente
	var player_scene = SKINS.get(skin_selecionada, SKINS["jogador"])  # Se não encontrar, usa a skin padrão ("jogador")
	
	# Instanciar o jogador com a skin selecionada
	var p1 = player_scene.instantiate()
	add_child(p1)
	p1.position.x = 56
	p1.position.y = 128
	p1.seguir_camera(camera)

func _process(delta: float) -> void:
	pass

func reiniciar_fase():
	$reiniciar_jogo.start()

func _on_reiniciar_jogo_timeout() -> void:
	get_tree().reload_current_scene()
	Global.moedas = 0  # Resetando a quantidade de moedas

func _on_voltar_button_mouse_entered() -> void:
	pass # Replace with function body.

# Este método captura qualquer entrada, como teclas pressionadas
func _input(event):
	# Verifica se a tecla "V" foi pressionada
	if event is InputEventKey and event.pressed and event.keycode == KEY_V:
		# Troca para a cena de menu
		get_tree().change_scene_to_file("res://personagens/menu.tscn")
