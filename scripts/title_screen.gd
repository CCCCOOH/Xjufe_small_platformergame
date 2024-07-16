extends Control

@onready var start = $start

func _ready():
	start.grab_focus()	# 获取焦点


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_quit_pressed():
	get_tree().quit()
