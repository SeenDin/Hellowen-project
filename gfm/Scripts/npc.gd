extends AnimatedSprite2D

var is_chatting = false
var is_roaming = true

var player_in_area = false


func _ready() -> void:
	Dialogic.signal_event.connect(DialogicSignal)

func _on_chat_detection_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true

func _on_chat_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false


func _process(delta: float) -> void:
		if player_in_area:
			if Input.is_action_just_pressed("e"):
				run_dialogue("timeline_lisa1")

func run_dialogue(dialogue_string):
	is_chatting = true
	is_roaming = false
	
	Dialogic.start(dialogue_string)


func DialogicSignal(arg: String):
	if arg == "exit_lisa":
		queue_free()
