extends Node3D

@onready
var roman = get_node("Roman");

var list_numbers : Array

func _ready():
	for board in $LearningBoard.get_children():
		board.connect("ValueSelected", play_sound)
	for board in $TypingBoard.get_children():
		board.connect("ValueSelected",play_sound)
		board.connect("ValueSelected",guess_number)
	
	
func play_sound(idx) :
	var audio_to_play = get_node("Audios/"+str(idx+1))
	audio_to_play.play()
	roman.change_frame(idx)

func _process(delta):
	if (Input.is_action_just_pressed ("ui_accept")): 
		$LabelViewport.get_scene_instance().create_number()
		list_numbers = $LabelViewport.get_scene_instance().soal
		#for board in $Boards.get_children():
			#board.change_number()
func guess_number(idx) :
	if (! list_numbers.is_empty()):
		if (list_numbers[-1] == idx) :
			$SoalAnimPlayer.play("Benar")
			list_numbers.pop_back()
			if (list_numbers.is_empty()):
				print("win one")
		else :
			$SoalAnimPlayer.play("Salah")
			
	
