extends Control

@export var level = 1
@export var enemy_damage = 15
@export var enemy_open_mouth: Texture2D
@export var phase_2: Texture2D

var Q = preload("res://Scripts/questions.gd")

var hp = 100
var enemy_hp = 100
var enemy_max_hp = 100

var questions = []
var left = []
var q = []
var order = [0, 1, 2, 3]
var enemy_pic
var phase2_started = false
var bag_cooldown = 0

# info om ideologien til idk knappen (level 1-6)
var info = [
	"Nationalkonservatisme: nationen, dansk kultur og traditioner skal beskyttes. Vil have stram udlændingepolitik og mindre EU.",
	"Politisk midte: vil samarbejde med både højre og venstre og finde løsninger der virker i praksis.",
	"Liberalisme: individets frihed er vigtigst. Vil have lavere skat, mindre stat og et frit marked.",
	"Nationalkonservatisme: fokus på danske værdier, stram udlændingepolitik og krav til integration.",
	"Demokratisk socialisme: vil mindske ulighed med mere skat til de rige, mere velfærd og mere demokrati i økonomien.",
	"Socialdemokratisme: en stærk velfærdsstat betalt af skat, men stadig med markedsøkonomi og private virksomheder."
]

func _ready():
	$Menu/FightButton.pressed.connect(fight)
	$Menu/BagButton.pressed.connect(bag)
	$Menu/idkButton.pressed.connect(run)
	$QuestionPanel/AnswerA.pressed.connect(answer.bind(0))
	$QuestionPanel/AnswerB.pressed.connect(answer.bind(1))
	$QuestionPanel/AnswerC.pressed.connect(answer.bind(2))
	$QuestionPanel/AnswerD.pressed.connect(answer.bind(3))

	# så lange svar kan være der
	$QuestionPanel/AnswerA.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	$QuestionPanel/AnswerB.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	$QuestionPanel/AnswerC.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	$QuestionPanel/AnswerD.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

	questions = Q.all[level - 1]
	enemy_max_hp = questions.size() * 25
	if level <= 3:
		enemy_max_hp = 100 # de første 3 er lettere
	if phase_2 != null:
		enemy_max_hp = enemy_max_hp * 2 
	enemy_hp = enemy_max_hp
	enemy_pic = $EnemySprite.texture
	update_hp()

func update_hp():
	$EnemyInfo/HPBar.max_value = enemy_max_hp
	$EnemyInfo/HPBar.value = enemy_hp
	$EnemyInfo/HPLabel.text = str(enemy_hp) + " / " + str(enemy_max_hp)
	$PlayerInfo/HPBar.value = hp
	$PlayerInfo/HPLabel.text = str(hp) + " / 100"

func message(text):
	$MessageBox/MessageLabel.text = text
	await get_tree().create_timer(2.0).timeout

func fight():
	$Menu.hide()
	if bag_cooldown > 0:
		bag_cooldown -= 1
	if left.size() == 0:
		left = questions.duplicate()
		left.shuffle()
	q = left.pop_back()

	order.shuffle() #### ellers er det rigtige svar altid A
	$QuestionPanel/QuestionLabel.text = q[0]
	$QuestionPanel/AnswerA.text = "A. " + q[order[0] + 1]
	$QuestionPanel/AnswerB.text = "B. " + q[order[1] + 1]
	$QuestionPanel/AnswerC.text = "C. " + q[order[2] + 1]
	$QuestionPanel/AnswerD.text = "D. " + q[order[3] + 1]
	$QuestionPanel.show()

func answer(number):
	$QuestionPanel.hide()
	var damage = q[5][order[number]]
	enemy_hp -= damage
	if enemy_hp < 0:
		enemy_hp = 0
	update_hp()

	if damage == 25:
		await message("STRONG ARGUMENT! NOW SPEAK YOUR MIND\n-" + str(damage) + " HP")
	elif damage == 10:
		await message("Okay argument...\n-" + str(damage) + " HP")
	else:
		await message("Weak argument bud\n-" + str(damage) + " HP")

	#### fase 2
	if phase_2 != null and phase2_started == false and enemy_hp <= enemy_max_hp / 2 and enemy_hp > 0:
		phase2_started = true
		enemy_pic = phase_2
		enemy_open_mouth = null
		$EnemySprite.texture = phase_2
		questions = Q.mette_phase_2
		left = []
		await message("PHASE 2!!\nMette is getting serious...")
		enemy_hp += enemy_max_hp / 4 # får 25% liv tilbage
		update_hp()
		await message("Mette is growing stronger than ever " + str(enemy_max_hp / 4) + " HP!")

	if enemy_hp <= 0:
		$MessageBox/MessageLabel.text = "you won! noobb"
	else:
		enemy_turn()

func bag():
	if bag_cooldown > 0:
		message("Bag is on cooldown, " + str(bag_cooldown) + " turns left")
		return
	$Menu.hide()
	bag_cooldown = 5
	hp += 20
	if hp > 100:
		hp = 100
	update_hp()
	await message("You just healed 20 HP")
	enemy_turn()

func run():
	$MessageBox/MessageLabel.text = info[level - 1]

func enemy_turn():
	if enemy_open_mouth != null:
		$EnemySprite.texture = enemy_open_mouth
	await message($EnemyInfo/NameLabel.text + " is attacking")
	$EnemySprite.texture = enemy_pic

	hp -= enemy_damage
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
		
		
