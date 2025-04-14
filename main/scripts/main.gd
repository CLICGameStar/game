extends Control

func _on_bullet_hell_pressed() -> void:
	get_tree().change_scene_to_file("res://puzzle/scenes/puzzle.tscn")
	
func on_puzzle_game_pressed() -> void:
		get_tree().change_scene_to_file("res://puzzle/scenes/puzzle.tscn")
