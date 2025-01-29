extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
@onready var anim = $animacao as AnimatedSprite2D
var pulando := false
@onready var remote = $remote as RemoteTransform2D

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		pulando = true
	
	if is_on_floor():
		pulando = false
	else:
		pulando = true

	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		if direction < 0:  # Move left
			anim.flip_h = true  # Flip horizontally for left
		else:  # Move right
			anim.flip_h = false  # Ensure the sprite faces right

		if not pulando:
			anim.play("correndo")
		elif pulando:
			anim.play("pulando")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not pulando:
			anim.play("parado")
		else:
			anim.play("pulando")
	
	# Evitar que o personagem caia para fora da tela
	if position.y > 700:
		position.y = -10
		
	move_and_slide()

func _on_dano_jogador_body_entered(body: Node2D) -> void:
	if body.is_in_group("inimigos"):
		queue_free()
		get_tree().current_scene.reiniciar_fase()


func seguir_camera(camera):
	var caminho_camera = camera.get_path()
	remote.remote_path = caminho_camera
