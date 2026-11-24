@tool
extends Control
class_name LevelIcon

@export var world_index: int = 1
@export var next_level_up: LevelIcon
@export var next_level_down: LevelIcon
@export var next_level_left: LevelIcon
@export var next_level_right: LevelIcon

func _ready():
	$Label.text = "Level" + str(world_index)

func _process(delta):
	if Engine.is_editor_hint():
			$Label.text = "Level" + str(world_index)
	
