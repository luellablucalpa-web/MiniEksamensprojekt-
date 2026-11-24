extends Control

var hp =100
var enemy_hp = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fight.pressed.connect(attack)
	$secondB.pressed.connect (inv)

func attack() -> void:
	$Message.text = "HIT"

func inv() -> void:
	$Message.text = "inv type shit"

# Called every frame. 'delta' is the elapsed time since the previous frame.
