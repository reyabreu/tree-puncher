extends Node

export (PackedScene) var trunk_scene

onready var first_trunk_position = $FirstTrunkPosition

var last_spawn_position
var trunks = []

func _ready():
	last_spawn_position = first_trunk_position.position
	_spawn_empty_tree()
	
func _spawn_empty_tree():
	for counter in range (5):
		var new_trunk = trunk_scene.instance()
		add_child(new_trunk)
		new_trunk.position = last_spawn_position
		last_spawn_position.y -= new_trunk.sprite_height
		new_trunk.setup_trunk(false, false)
		trunks.append(new_trunk)
		
func punch_tree(from_right):
	trunks.front().remove(from_right)
	trunks.pop_front()