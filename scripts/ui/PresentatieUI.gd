extends Control

@onready var tekst_label = $Panel/VBoxContainer/TekstLabel
@onready var volgende_knop = $Panel/VBoxContainer/Button

var teksten = [
	"Je loopt naar de presentatieplek en zet je laptop klaar.",
	"Je laat het publiek zien hoe je product tot stand is gekomen.",
	"Je toont je flowcharts en ontwerpkeuzes aan het publiek.",
    "Het publiek luistert aandachtig naar je presentatie."
]

var huidige_tekst: int = 0

func _ready():
	volgende_knop.pressed.connect(_on_volgende_pressed)
	tekst_label.text = teksten[huidige_tekst]

func _on_volgende_pressed():
	huidige_tekst += 1
	if huidige_tekst < teksten.size():
		tekst_label.text = teksten[huidige_tekst]
	else:
		GameState.huidige_stap = 2
		queue_free()
