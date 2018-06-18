extends Node2D

onready var animation = $Animation

var center_x
var player_center_offset

func _ready():
	center_x = get_viewport_rect().size.x / 2
	player_center_offset = abs(position.x - center_x)
	
func _input(event):
	var from_right
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and event.is_pressed():
		if event.position.x < center_x:
			position.x = center_x - player_center_offset
			scale.x = -abs(scale.x)
			get_parent().punch_tree(false)
		else:
			position.x = center_x + player_center_offset
			scale.x = abs(scale.x)
			get_parent().punch_tree(true)
			
		animation.play("punch")	
