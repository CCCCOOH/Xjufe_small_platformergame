extends Area2D
@onready var animation_player = $AnimationPlayer
@onready var game_manager: GameManager = %GameManager



func _on_body_entered(body):
	game_manager.add_score(10)
	animation_player.play("pickup")
