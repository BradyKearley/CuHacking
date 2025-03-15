extends AudioStreamPlayer2D

const level_music = preload("res://SFX/level-song.wav")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	play()

func play_music_level():
	_play_music(level_music)
