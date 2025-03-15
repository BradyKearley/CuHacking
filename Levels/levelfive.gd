extends StaticBody2D

func _ready():
	AudioPlayer.play_music_level()
	$Box.change_size()
