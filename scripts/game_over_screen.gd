extends Control
@onready var game_over_score_label = $GameOverScoreLabel

func display_score(final_score: int):
	game_over_score_label.text = "Your Scores: " + str(final_score)

func _on_quit_pressed():
	get_tree().quit()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
