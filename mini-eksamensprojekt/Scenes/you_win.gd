extends Control
@onready var youwin_buttons: VBoxContainer = $YouwinButtons
@onready var settings: Panel = $Settings


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	youwin_buttons.visible = true
	settings.visible = false


func _on_exit_pressed() -> void:
		get_tree().quit()


func _on_retry_pressed() -> void:
	pass # Replace with function body.


func _on_menu_pressed() -> void:
	youwin_buttons.visible = false
	settings.visible = true


func _on_back_pressed() -> void:
	_ready()
