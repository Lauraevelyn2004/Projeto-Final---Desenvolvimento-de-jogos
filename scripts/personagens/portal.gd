extends Area2D

var fase_transicao := false  # Variável para controlar se a transição está em andamento

func _on_body_entered(body: Node) -> void:
	if body.name == "Jogador" and not fase_transicao:  # Verifica se é o jogador e se a transição não está em andamento
		var cena_atual = get_tree().current_scene.name  # Obtém o nome da cena atual
		var moedas_necessarias = Global.get_moedas_necessarias(cena_atual)  # Obtém as moedas necessárias para a fase atual
		
		if Global.moedas >= moedas_necessarias:
			fase_transicao = true
			print("Moedas suficientes. Iniciando transição de fase...")
			call_deferred("_mudar_fase")  # Aguarda o próximo frame para mudar de fase
		else:
			fase_transicao = true
			print("Moedas insuficientes para passar de fase!")
			call_deferred("_mostrar_moedas_insuficientes")  # Mostra mensagem ou cena de aviso

func _mudar_fase() -> void:
	# Obtém o nome da cena atual e decide a próxima fase
	var cena_atual = get_tree().current_scene.name
	match cena_atual:
		"Fase01":
			mudar_para_fase("res://levels/fase_02.tscn", "Mudando para Fase 02")
		"Fase02":
			mudar_para_fase("res://levels/fase_03.tscn", "Mudando para Fase 03")
		"Fase03":
			mudar_para_fase("res://levels/fase_04.tscn", "Mudando para Fase 04")
		"Fase04":
			mudar_para_fase("res://levels/fase_05.tscn", "Mudando para Fase 05")
		"Fase05":
			mudar_para_fase("res://levels/fase_06.tscn", "Mudando para Fase 06")
		"Fase06":
			mudar_para_fase("res://levels/fim.tscn", "Mudando para o final")  # Exemplo de cena final

func mudar_para_fase(caminho_fase: String, mensagem: String) -> void:
	print(mensagem)
	Global.moedas = 0  # Reseta as moedas para a próxima fase
	get_tree().change_scene_to_file(caminho_fase)  # Muda para a próxima fase

func _mostrar_moedas_insuficientes() -> void:
	print("Você precisa de mais moedas para passar de fase!")
	get_tree().change_scene_to_file("res://cenarios/moedasinsuficientes.tscn")  # Cena para informar moedas insuficientes

func _ready() -> void:
	fase_transicao = false  # Reseta o estado de transição para permitir futuras mudanças
