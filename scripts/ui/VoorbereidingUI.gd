extends Control

@onready var presentatie_checkbox = $Panel/VBoxContainer/CheckBox
@onready var documentatie_checkbox = $Panel/VBoxContainer/CheckBox2
@onready var bevestig_knop = $Panel/VBoxContainer/Button

func _ready():
	bevestig_knop.pressed.connect(_on_bevestigen_pressed)

func _on_bevestigen_pressed():
	GameState.heeft_presentatie = presentatie_checkbox.button_pressed
	GameState.heeft_documentatie = documentatie_checkbox.button_pressed
	
	if GameState.heeft_presentatie:
		GameState.score += 15
	if GameState.heeft_documentatie:
		GameState.score += 15
	
	GameState.huidige_stap = 1
	queue_free()
