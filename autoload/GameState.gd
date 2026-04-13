extends Node

var heeft_presentatie: bool = false
var heeft_documentatie: bool = false
var score: int = 0
var huidige_stap: int = 0

func reset():
	heeft_presentatie = false
	heeft_documentatie = false
	score = 0
	huidige_stap = 0
