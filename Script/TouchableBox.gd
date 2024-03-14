extends Node3D

func change_number() :
	$Mesh/Image.frame = randi() %9

func _ready() :
	$Mesh/Image.frame = randi() %9
