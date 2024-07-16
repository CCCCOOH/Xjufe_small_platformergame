extends Node2D
@onready var game_timer = %GameTimer
@onready var time_label = %TimeLabel
@onready var player = %Player
@onready var born_position = %BornPosition


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Start Game!") # Replace with function body.
	game_timer.start()
	player.position = born_position.position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_label.text = "TimeLeave: "+ str(int(game_timer.time_left))
