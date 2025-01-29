extends CharacterBody2D

# Variáveis de velocidade e direção
var speed = 200  # Velocidade da bola de fogo
var direction = Vector2(1, 0)  # Direção inicial para a direita

func _ready():
	# Inicializar a velocidade da bola de fogo para a direção inicial
	velocity = direction * speed

func _process(delta):
	# Mover a bola de fogo na direção atual
	move_and_slide()

	# Exemplo de evento para mudar a direção após 2 segundos
	if position.x > 400:  # Alterar quando a bola atingir um valor X específico
		direction = Vector2(-1, 0)  # Mudar direção para a esquerda
		velocity = direction * speed  # Atualizar a velocidade
