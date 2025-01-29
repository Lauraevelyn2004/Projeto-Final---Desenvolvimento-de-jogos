extends Area2D

var moedas := 1

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

# Função chamada quando o corpo entra na área da moeda
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Jogador":
		$anim.play("coletar")  # Toca a animação de coleta
		# Chama call_deferred para garantir que o objeto seja removido após a animação
		$colisao.call_deferred("queue_free")
		# Acessa e incrementa a variável de moedas global
		if Global.has_method("adicionar_moedas"):
			Global.adicionar_moedas(1)  # Chama a função de adicionar moedas no Global
		else:
			print("Erro: Método 'adicionar_moedas' não encontrado em Global!")

# Função chamada quando a animação termina
func _on_anim_animation_finished() -> void:
	queue_free()  # Remove a moeda da cena
