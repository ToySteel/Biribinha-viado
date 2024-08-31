extends CharacterBody2D

# Constantes de movimento
const GRAVITY = 1200.0
const JUMP_FORCE = -600.0
const MOVE_SPEED = 300.0

# Variáveis para armazenar o estado do jogador

func _ready():
	# Ativa a câmera para seguir o jogador
	$Camera2D.current = true

func _physics_process(delta):
	# Aplica gravidade
	velocity.y += GRAVITY * delta
	
	# Movimento horizontal
	if Input.is_action_pressed("ui_right"):
		velocity.x = MOVE_SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -MOVE_SPEED
	else:
		velocity.x = 0
	
	# Pular
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_FORCE
	
