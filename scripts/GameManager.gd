class_name GameManager extends Node

var final_score:int
var score:int = 0
@onready var playing_score_label = %PlayingScoreLabel
@onready var game_over_screen = %GameOverScreen
@onready var time_label = %TimeLabel
@onready var player = %Player
@onready var main_back = %MainBack

func add_score(n:int = 1):
	score += n
	playing_score_label.text = "You've collected " + str(score) + " coins!"


func _on_game_timer_timeout():
	game_over_screen.visible = true
	main_back.visible = false
	final_score = score
	game_over_screen.display_score(final_score)
	time_label.visible = false
	playing_score_label.visible = false
	player.stop_move()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
