extends Node

var solo_levels = [
	"res://Levels/level_one.tscn",
	"res://Levels/level_two.tscn",
	"res://Levels/level_two_and_a_half.tscn",
	"res://Levels/level_three.tscn",
	"res://Levels/level_four.tscn",
	"res://Levels/levelfive.tscn",
	"res://Levels/level_six.tscn",
	"res://Levels/level_nine.tscn",
	"res://Levels/level_seven.tscn",
	"res://Levels/level_ten.tscn",
	"res://Levels/level_something.tscn"
]

var duo_levels = [
	"res://Levels//DuoLevels/duo_level_1.tscn","res://Levels//DuoLevels/duo_level_4.tscn",
	"res://Levels//DuoLevels/duo_level_2.tscn"
]

var level_index = 0

func load_next_level():
	level_index += 1
	if Global.duo:
		if level_index < duo_levels.size():
			get_tree().change_scene_to_file(duo_levels[level_index])
		else:
			print("Game Over or Loop Back to First Level")
			level_index = 0  # Restart game or handle differently
			get_tree().change_scene_to_file("res://Levels/credits_level.tscn")
	else:
		if level_index < solo_levels.size():
			get_tree().change_scene_to_file(solo_levels[level_index])
		else:
			print("Game Over or Loop Back to First Level")
			level_index = 0  # Restart game or handle differently
			get_tree().change_scene_to_file("res://Levels/credits_level.tscn")
