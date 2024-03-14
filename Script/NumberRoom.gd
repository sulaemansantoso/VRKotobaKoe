extends Node3D


func _process(delta):
	if (Input.is_action_just_pressed ("ui_accept")):
		for board in $Boards.get_children():
			board.change_number()
