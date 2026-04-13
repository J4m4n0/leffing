extends Area2D

@export var zone_id: int = 0

@onready var label = $Label

var speler_in_zone: bool = false

func _ready():
	label.visible = false

func _process(_delta):
	if speler_in_zone and Input.is_action_just_pressed("interact"):
		if zone_id == GameState.huidige_stap:
			var ui_scenes = [
				"res://scenes/ui/VoorbereidingUI.tscn",
    			"res://scenes/ui/PresentatieUI.tscn"
			]
			var ui = load(ui_scenes[zone_id]).instantiate()
			get_tree().root.add_child(ui)

func _on_body_entered(body):
	if body.is_in_group("speler"):
		speler_in_zone = true
		if zone_id == GameState.huidige_stap:
			label.visible = true

func _on_body_exited(body):
	if body.is_in_group("speler"):
		speler_in_zone = false
		label.visible = false
