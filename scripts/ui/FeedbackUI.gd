extends Control

@onready var uitleg_label = $Panel/VBoxContainer/UitlegLabel
@onready var assertief_knop = $Panel/VBoxContainer/AssertieButton
@onready var passief_knop = $Panel/VBoxContainer/PassiefButton
@onready var defensief_knop = $Panel/VBoxContainer/DefensiefButton

func _ready():
	assertief_knop.pressed.connect(_on_assertief_pressed)
	passief_knop.pressed.connect(_on_passief_pressed)
	defensief_knop.pressed.connect(_on_defensief_pressed)
	uitleg_label.text = ""

func _on_assertief_pressed():
	GameState.score += 10
	uitleg_label.text = "Goed! Assertief reageren laat zien dat je openstaat voor verbetering."
	await get_tree().create_timer(2.0).timeout
	GameState.huidige_stap = 3
	queue_free()

func _on_passief_pressed():
	uitleg_label.text = "Je reageert niet defensief, maar je doet ook niets met de feedback."
	await get_tree().create_timer(2.0).timeout
	GameState.huidige_stap = 3
	queue_free()

func _on_defensief_pressed():
	GameState.score -= 5
	uitleg_label.text = "Pas op! Defensief reageren wekt de indruk dat je niet openstaat voor feedback."
	await get_tree().create_timer(2.0).timeout
	GameState.huidige_stap = 3
	queue_free()
