extends Control

var hp = 100
var enemy_hp = 200

# spørgsmålenmenene og svar og hvilket svar der er rigtigt (0 = første = A)
var questions = [
	["Did Mu fart?", "Yes", "No", "", "", 0],
	["Did Simon fart?", "Yes", "No", "Probably", "", 2],
	["is luella a fart smella?", "Yes", "No", "ewww", "nah cus cus", 0],
	["jack is the coolest guy ever", "Yes", "No", "debatable", "", 0]
]
var q = []

func _ready():
	$Menu/FightButton.pressed.connect(fight)
	$Menu/BagButton.pressed.connect(bag)
	$Menu/idkButton.pressed.connect(run)
	$QuestionPanel/AnswerA.pressed.connect(answer.bind(0))
	$QuestionPanel/AnswerB.pressed.connect(answer.bind(1))
	$QuestionPanel/AnswerC.pressed.connect(answer.bind(2))
	$QuestionPanel/AnswerD.pressed.connect(answer.bind(3))
	update_hp()

func update_hp():
	$EnemyInfo/HPBar.max_value = 200
	$EnemyInfo/HPBar.value = enemy_hp
	$EnemyInfo/HPLabel.text = str(enemy_hp) + " / 200"
	$PlayerInfo/HPBar.value = hp
	$PlayerInfo/HPLabel.text = str(hp) + " / 100"

func message(text):
	$MessageBox/MessageLabel.text = text
	await get_tree().create_timer(1.5).timeout

func fight():
	$Menu.hide()
	q = questions.pick_random()
	$QuestionPanel/QuestionLabel.text = q[0]
	$QuestionPanel/AnswerA.text = q[1]
	$QuestionPanel/AnswerB.text = q[2]
	$QuestionPanel/AnswerC.text = q[3]
	$QuestionPanel/AnswerD.text = q[4]
	# tomme svar bliver skjult
	$QuestionPanel/AnswerC.visible = q[3] != ""
	$QuestionPanel/AnswerD.visible = q[4] != ""
	$QuestionPanel.show()

func answer(number):
	$QuestionPanel.hide()
	if number == q[5]:
		enemy_hp -= 25
		update_hp()
		await message("Correct! NOW SPEAK YOUR MIND")
	else:
		await message("Wrong answer bud")

	if enemy_hp <= 0:
		$MessageBox/MessageLabel.text = "you won! noobb"
	else:
		enemy_turn()

func bag():
	$Menu.hide()
	hp += 20
	if hp > 100:
		hp = 100
	update_hp()
	await message("You just healed 20 HP")
	enemy_turn()

func run():
	message("hello")

func enemy_turn():
	await message("Mette is attacking")
	hp -= 15
	update_hp()
	if hp <= 0:
		$MessageBox/MessageLabel.text = "lol u lost"
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Defeated.tscn")
		
	else:
		$MessageBox/MessageLabel.text = "WHAT ARE YOU GONNA DO NOW"
		$Menu.show()
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Scenes/level_select/level_select.tscn")
		
		
