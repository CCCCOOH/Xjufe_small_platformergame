class_name Player extends CharacterBody2D
@onready var born_position = %BornPosition
@onready var animated_sprite = $AnimatedSprite2D
@onready var hurt_auido_player = $HurtAuidoPlayer
@onready var jump_audio_player = $JumpAudioPlayer


var SPEED = 130.0
var JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var resetting = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_audio_player.play()

	# 获取输入方向
	var direction = Input.get_axis("move_left", "move_right")

	if direction == 1:
		animated_sprite.flip_h = false
	elif direction == -1:
		animated_sprite.flip_h = true
	
	if is_on_floor():	# 在地面上
	# 播放闲置动画
		if direction == 0:
			animated_sprite.play("idle")
		else:	# 播放奔跑动画
			animated_sprite.play("run")
	else:	# 不在地面上
		animated_sprite.play("jump")
			
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func reset_pos():
	hurt_auido_player.play()
	position = born_position.position
	print("reset")

func stop_move():
	SPEED = 0
	JUMP_VELOCITY = 0
