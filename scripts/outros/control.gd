extends Control

@onready var contador_moedas = $container/moedas_container/contador as Label

func _ready() -> void:
	# Atualiza o contador de moedas ao iniciar, usando a variável global 'moedas'
	contador_moedas.text = str("%04d" % Global.moedas)

func _process(delta: float) -> void:
	# Atualiza o contador de moedas durante o jogo, usando a variável global 'moedas'
	contador_moedas.text = str("%04d" % Global.moedas)
