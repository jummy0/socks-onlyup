extends Control

const HOLD_TIME := 3.5
const TRANSPARENT_BLACK := Color(Color.BLACK, 0.0)

# Twitch users to exclude from Special Thanks
var twitch_user_ignore_list := [
	"socksbx",
]

@onready var special_thanks := $SpecialThanks
@onready var role := $CreditRole
@onready var left := $CreditLeft
@onready var right := $CreditRight
@onready var center := $CreditCenter
@onready var sub_view_container := $SubViewportContainer
@onready var sub_view := $SubViewportContainer/SubViewport
@onready var color_rect := $ColorRect

func _ready() -> void:
	visible = false
	role.visible = false
	center.visible = false
	left.visible = false
	right.visible = false
	color_rect.visible = false
	sub_view_container.visible = false
	special_thanks.visible = false
	special_thanks.position.y = 720.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_roll_credits") and OS.is_debug_build():
		roll_credits()


func roll_credits() -> void:
	if visible: return
	var tree := get_tree()
	visible = true
	SOGlobal.play_sound(preload("res://mario/credits.ogg"), 0)
	await tree.create_timer(4.0).timeout
	fade_in(color_rect, 2.0)
	await tree.create_timer(3.0).timeout
	if get_parent() is LibSM64Mario:
		get_parent().action = LibSM64.ACT_UNINITIALIZED
	fade_in(sub_view_container, 2.0)
	
	await tree.create_timer(1.0).timeout
	role.text = "GAME PRODUCER"
	center.text = "Twilight"
	fade_in(role)
	await tree.create_timer(1.0).timeout
	fade_in(center)
	await tree.create_timer(HOLD_TIME).timeout
	fade_out([role, center])
	
	await tree.create_timer(1.0).timeout
	role.text = "GAME DESIGNERS"
	left.text = "Arch_Mage\n\nDunkleDubs"
	right.text = "AstralSlash\n\njummy"
	fade_in(role)
	await tree.create_timer(1.0).timeout
	fade_in([left, right])
	await tree.create_timer(HOLD_TIME).timeout
	fade_out([left, right])
	await tree.create_timer(1.0).timeout
	left.text = "Polyhex\n\nrox"
	right.text = "ROBBYDUDE\n\nRusty"
	fade_in([left, right])
	await tree.create_timer(HOLD_TIME).timeout
	fade_out([role, left, right])
	
	await tree.create_timer(1.0).timeout
	role.text = "SUPER MARIO 64 DECOMPILATION"
	left.text = "mountainflaw\n\nbramhaag"
	right.text = "ahouts\n\nRevoSucks"
	center.text = "\n\n\n\nmatt-kempster"
	fade_in(role)
	await tree.create_timer(1.0).timeout
	fade_in([left, center, right])
	await tree.create_timer(HOLD_TIME).timeout
	fade_out([role, left, center, right])
	
	await tree.create_timer(1.0).timeout
	role.text = "LIBSM64"
	left.text = "jaburns\n\nBrawmario"
	right.text = "MeltyPlayer\n\nosnr"
	center.text = "\n\n\n\nzalo"
	fade_in(role)
	await tree.create_timer(1.0).timeout
	fade_in([left, center, right])
	await tree.create_timer(HOLD_TIME).timeout
	fade_out([left, center, right])
	await tree.create_timer(1.0).timeout
	left.text = "headshot2017\n\nHeath123"
	right.text = "kafeijao\n\n00unkn0wn00"
	center.text = "\n\n\n\nlammmab"
	fade_in([left, center, right])
	await tree.create_timer(HOLD_TIME).timeout
	fade_out([role, left, center, right])
	
	await tree.create_timer(1.0).timeout
	role.text = "LIBSM64-GODOT"
	left.text = "Brawmario"
	right.text = "Gapva"
	center.text = "\n\njscottmiller"
	fade_in(role)
	await tree.create_timer(1.0).timeout
	fade_in([left, center, right])
	await tree.create_timer(HOLD_TIME).timeout
	fade_out([role, left, center, right])
	
	await tree.create_timer(1.0).timeout
	var tween = tree.create_tween()
	tween.tween_property(sub_view_container, "position", Vector2(420, 40), 1.0)
	tween.play()
	tween = tree.create_tween()
	tween.tween_property(sub_view, "size", Vector2i(500, 640), 1.0)
	tween.play()
	
	await tree.create_timer(1.0).timeout
	special_thanks.visible = true
	tween = tree.create_tween()
	tween.tween_property(special_thanks, "position", Vector2(special_thanks.position.x, - special_thanks.size.y), 154.0)
	tween.play()
	
	await tree.create_timer(154.0).timeout
	tween = tree.create_tween()
	tween.tween_property(sub_view_container, "position", Vector2(60, 60), 1.0)
	tween.play()
	tween = tree.create_tween()
	tween.tween_property(sub_view, "size", Vector2i(840, 480), 1.0)
	tween.play()
	
	await tree.create_timer(2.0).timeout
	role.position.y += 100
	center.position.y += 100
	role.text = "PLAYER"
	center.text = "SocksBX"
	fade_in(role, 3.0)
	
	await tree.create_timer(3.0).timeout
	fade_in(center, 3.0)
	
	await tree.create_timer(6.0).timeout
	SOGlobal.play_sound(preload("res://mario/thank_you_so_much_for_to_playing_my_game.wav"), -2)
	
	await tree.create_timer(3.0).timeout
	fade_out([role, center, sub_view_container], 3.0)
	
	await tree.create_timer(5.0).timeout
	fade_out(color_rect)
	if get_parent() is LibSM64Mario:
		get_parent().action = LibSM64.ACT_IDLE
	
	await tree.create_timer(1.0).timeout
	visible = false

func fade_in(object: Variant, time: float = 1.0) -> void:
	_fade(object, time, Color.TRANSPARENT, Color.WHITE)

func fade_out(object: Variant, time: float = 1.0) -> void:
	_fade(object, time, Color.WHITE, Color.TRANSPARENT)

func _fade(object: Variant, time: float, from: Color, to: Color) -> void:
	if object is Array:
		var tree := get_tree()
		for i in object:
			i.modulate = from
			i.visible = true
			var tween = tree.create_tween()
			tween.tween_property(i, "modulate", to, time)
			tween.play()
	else:
		object.modulate = from
		object.visible = true
		var tween = get_tree().create_tween()
		tween.tween_property(object, "modulate", to, time)
		tween.play()
