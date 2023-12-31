@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("FuriganaTextLabel", "RichTextLabel", \
		preload("FuriganaTextLabelScript.gd"), preload("furigana.svg"))


func _exit_tree() -> void:
	remove_custom_type("FuriganaTextLabel")
