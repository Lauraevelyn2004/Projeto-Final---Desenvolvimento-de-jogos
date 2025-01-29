extends Node

# Variáveis globais
var skin_selecionada: String = "jogador"  # Skin inicial padrão
var moedas: int = 0  # Moedas iniciais

# Dicionário para armazenar as configurações de moedas por fase
var moedas_por_fase := {
	"Fase01": 10,
	"Fase02": 10,
	"Fase03": 25,
	"Fase04": 25,
	"Fase05": 30,
	"Fase06": 30
}

# Função para definir a skin selecionada
func set_skin(nova_skin: String) -> void:
	if nova_skin in ["jogador", "skin1"]:  # Adicione outras skins se necessário
		skin_selecionada = nova_skin
		print("Skin selecionada alterada para: %s" % skin_selecionada)
	else:
		print("Erro: Skin '%s' não é válida!" % nova_skin)

# Função para obter a skin selecionada
func get_skin() -> String:
	return skin_selecionada

# Função para adicionar moedas
func adicionar_moedas(quantidade: int) -> void:
	moedas += quantidade
	print("Moedas adicionadas: %d. Total: %d" % [quantidade, moedas])

# Função para remover moedas
func remover_moedas(quantidade: int) -> void:
	if moedas >= quantidade:
		moedas -= quantidade
		print("Moedas removidas: %d. Total: %d" % [quantidade, moedas])
	else:
		print("Erro: Não há moedas suficientes!")

# Função para obter as moedas necessárias para uma fase
func get_moedas_necessarias(fase: String) -> int:
	return moedas_por_fase.get(fase, 0)  # Retorna 0 se a fase não estiver no dicionário

# Debug: Mostra o estado atual das variáveis globais
func print_status() -> void:
	print("Estado atual - Skin: %s, Moedas: %d" % [skin_selecionada, moedas])
