extends Node

@onready var main_music = preload("res://audio/music.mp3")
@onready var defeat_music = preload("res://audio/dead.mp3")
@onready var pickup_music = preload("res://audio/pickup.mp3")
@onready var drop_music = preload("res://audio/drop.mp3")

var current_track = ""
var music_player: AudioStreamPlayer
var effect_player: AudioStreamPlayer

func _ready():
	music_player = AudioStreamPlayer.new()
	effect_player = AudioStreamPlayer.new()
	effect_player.volume_db = -15.0
	add_child(effect_player)
	add_child(music_player)
	music_player.connect("finished", Callable(self, "_on_music_finished"))

func play_main_music():
	current_track = "main"
	music_player.stream = main_music
	music_player.play()

func play_defeat_music():
	effect_player.stop()
	current_track = "defeat"
	music_player.stream = defeat_music
	music_player.play()
	
func play_pickup():
	effect_player.stream = pickup_music
	effect_player.play()
	
func play_drop():
	effect_player.stream = drop_music
	effect_player.play()

func _on_music_finished():
	if current_track == "main":
		music_player.play()
