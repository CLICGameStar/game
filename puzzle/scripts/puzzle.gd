extends Node2D

var base_key_color: Color = Color("808000")
@onready var key = $Key

enum COLOR {RED, GREEN, BLUE, GRAY}

func _ready() -> void:
	key.modulate = Color(1,1,0)

func _process(delta: float) -> void:
	if Input.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://main/scenes/main.tscn")
	if Input.is_action_pressed("move_right"):
		change_color(key, COLOR.BLUE)
	if Input.is_action_pressed("move_left"):
		change_color(key, COLOR.RED)
	if Input.is_action_pressed("move_down"):
		change_color(key, COLOR.GREEN)
	if Input.is_action_pressed("move_up"):
		change_color(key, COLOR.GRAY)
		

func change_color(object: Sprite2D, color: COLOR) -> void:
	match color :
		COLOR.RED:
			if base_key_color.r == 0:
				object.visible = false
			else:
				object.visible = true
				object.material = null
				object.modulate = Color(1,0,0)
		COLOR.GREEN:
			if base_key_color.g == 0:
				object.visible = false
			else:
				object.visible = true
				object.material = null
				object.modulate = Color(0,1,0)
		COLOR.BLUE:
			if base_key_color.b == 0:
				object.visible = false
			else:
				object.visible = true
				object.material = null
				object.modulate = Color(0,0,1)
		COLOR.GRAY:
			object.visible = true
			var shader = Shader.new()
			var shader_material = ShaderMaterial.new()
			var shader_code
			shader_code = """
					shader_type canvas_item;

					void fragment() {
						vec4 c = texture(TEXTURE, UV);
						float gray = (c.r + c.g + c.b) / 3.0;
						COLOR = vec4(gray, gray, gray, c.a);
					}
				"""
			shader.code = shader_code
			shader_material.shader = shader
			object.material = shader_material
	
