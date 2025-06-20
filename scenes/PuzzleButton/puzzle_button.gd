extends Area2D

var bodies_on_top: int = 0
signal pressed
signal unpressed 




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	bodies_on_top += 1
	if body.is_in_group("pushable") or body is Player:
		if bodies_on_top == 1:
			pressed.emit()
			print("i have been pushed")
			$AnimatedSprite2D.play("pressed")


func _on_body_exited(body: Node2D) -> void:
	bodies_on_top -= 1
	if body.is_in_group("pushable") or body is Player:
		if bodies_on_top == 0:
			unpressed.emit()
			print("i am no longer pushed") 
			$AnimatedSprite2D.play("unpressed")
