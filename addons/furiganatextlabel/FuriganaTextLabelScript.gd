@tool
extends RichTextLabel

@export var furigana_size = 20
var original_text: String
var furigana_code: String = "[table=1,l,l,1][cell][font_size=" \
	+ str(furigana_size) + \
	"]{furigana}[/font_size][/cell][cell]{kanji}[/cell][cell padding=5,0,0,0][/cell][/table]"

func _ready():
	var n_theme = Theme.new()
	n_theme.default_font_size = 30
	theme = n_theme
	bbcode_enabled = true
	original_text = text
	text = replace_ruby_tags(original_text)

func replace_ruby_tags(text: String) -> String:
	var pattern = "%ruby{([^,]+),([^}]+)}"
	var regex = RegEx.new()
	
	regex.compile(pattern)
	
	var result = text
	var match_data = regex.search(text)
	
	while match_data != null:
		var replacement = furigana_code.format( \
			{"furigana": match_data.get_string(2), "kanji": match_data.get_string(1)} \
		)
		result = result.replace(match_data.get_string(0), replacement)
		match_data = regex.search(result, match_data.get_end())
	
	return result
