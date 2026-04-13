extends Control

@onready var score_label = $Panel/VBoxContainer/ScoreLabel
@onready var uitleg_label = $Panel/VBoxContainer/UitlegLabel
@onready var opnieuw_knop = $Panel/VBoxContainer/Button

func _ready():
	opnieuw_knop.pressed.connect(_on_opnieuw_pressed)
	score_label.text = "Jouw score: %d / 40" % GameState.score
	uitleg_label.text = _genereer_uitleg()

func _genereer_uitleg() -> String:
	var uitleg = ""
	
	if GameState.heeft_presentatie:
		uitleg += "+ 15 punten: je had een presentatie meegenomen\n"
	else:
		uitleg += "+ 0 punten: je had geen presentatie meegenomen\n"
	
	if GameState.heeft_documentatie:
		uitleg += "+ 15 punten: je had documentatie meegenomen\n"
	else:
		uitleg += "+ 0 punten: je had geen documentatie meegenomen\n"
	
	if GameState.score >= 25:
		uitleg += "\nGoed gedaan! Je hebt je boodschap goed overgebracht."
	elif GameState.score >= 10:
		uitleg += "\nNiet slecht, maar er is ruimte voor verbetering."
	else:
		uitleg += "\nVolgende keer beter! Denk aan voorbereiding en passende feedback."
	
	return uitleg

func _on_opnieuw_pressed():
	GameState.reset()
	get_tree().reload_current_scene()
