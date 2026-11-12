extends Control
@onready var menu_buttons: VBoxContainer = $"Menu buttons"
@onready var settings: Panel = $Settings

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu_buttons.visible = true
	settings.visible = false


func _on_start_game_pressed() -> void:
	pass


func _on_options_pressed() -> void:
	menu_buttons.visible = false
	settings.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_options_pressed() -> void:
	_ready()
