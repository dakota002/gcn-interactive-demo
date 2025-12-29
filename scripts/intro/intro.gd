extends Control

@onready var logo = $Logo

func _process(delta):
	logo.rotation += 0.05 * delta

func _input(_event):
	if (Input.is_action_just_pressed("p1_primary") ||
		Input.is_action_just_pressed("p2_primary") ||
		Input.is_action_just_pressed("p3_primary") ||
		Input.is_action_just_pressed("p4_primary")):
		_end_intro()

func _end_intro():
	SceneManager.change_scene_with_transition(
		self,
		load("res://scenes/observatory_selection/telescope_select.tscn")
	)
