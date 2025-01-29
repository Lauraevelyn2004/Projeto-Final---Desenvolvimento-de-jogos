extends Sprite2D

var moedas := 10  # Exemplo de variável de moedas

# Função para ativar a imagem de moedas insuficientes
func ativar_imagem():
	# Condição para ativar a imagem
	if moedas < 10:  # Exemplo de condição: se o jogador tem menos de 10 moedas
		self.show()  # Torna a imagem visível
	else:
		self.hide()  # Caso contrário, esconde a imagem

# Função para esconder a imagem de moedas insuficientes
func esconder_imagem():
	self.hide()  # Torna a imagem invisível
