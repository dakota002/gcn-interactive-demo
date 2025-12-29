extends Control

# TODO: Update scene to use a better graphic for the circular frame

func _ready():
	set_process_input(true)

func _input(_event):
	if (Input.is_action_just_pressed("p1_primary") ||
		Input.is_action_just_pressed("p2_primary") ||
		Input.is_action_just_pressed("p3_primary") ||
		Input.is_action_just_pressed("p4_primary")):
		_start_game()

func _start_game():
	SceneManager.change_scene_with_transition(
		self,
		load("res://scenes/intro/intro.tscn")
	)
