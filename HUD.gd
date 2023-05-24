extends CanvasLayer
signal start_game

func update_score(score):
	$ScoreLabel.text=str(score)
	
func show_message(text):
	$MessageLabel.text=text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message('Game over')
#	print('zarp')
	await  $MessageTimer.timeout
#	print('zarp')
	$MessageLabel.text='Dodge the creeps'
	$MessageLabel.show()
	await get_tree().create_timer(1.0).timeout
	$Button.show()

func _on_button_pressed():
	$Button.hide()
	emit_signal('start_game')

func _on_message_timer_timeout():
	$MessageLabel.hide()
