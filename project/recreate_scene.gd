extends Control


@onready var _btn: Button = $Button


var _signal: Signal


func _ready():
	_signal = _btn.pressed


# Issue: Somehow the call to Signal.get_object() made in an if statement is returning a bool.  And then it continues to return bool from then on.
func _on_timer_1_timeout():
	# signal object should be valid (button not freed or anything) and it is a node
	if is_instance_valid(_signal.get_object()) and (_signal.get_object() is Node):
		print("Timer1: issue not reproduced") # if you see this message it's either fixed or I'm full of it
	else:
		# output parts of the if expression and to do some sanity checks
		print("Timer1: issue reproduce (expected)")
		print("Timer1: is_instance_valid(_signal.get_object()): %s, _signal.get_object() is Node: %s" % [is_instance_valid(_signal.get_object()), _signal.get_object() is Node])
		print("Timer1: _signal.get_object(): %s" % [_signal.get_object()])
		var temp = _signal.get_object()
		print("Timer1: Is _signal.get_object() really a bool??? %s" % (typeof(temp) == TYPE_BOOL))


# Issue work around:  Just call signal.get_object() before using in if statement.  No big deal.  But what other issues could this odd problem cause?
func _on_timer_2_timeout():
	var signal_object = _signal.get_object()
	# signal object should be valid (button not freed or anything) and it is a node
	if is_instance_valid(signal_object) and (signal_object is Node):
		print("Timer2: issue not reproduced (expected)") # this is expected - the rest just mirrors code above
	else:
		# output parts of the if expression and to do some sanity checks
		print("Timer2: issue reproduce")
		print("Timer2: is_instance_valid(signal_object): %s, signal_object is Node: %s" % [is_instance_valid(signal_object), signal_object is Node])
		print("Timer2: _signal.get_object(): %s" % [_signal.get_object()])
		print("Timer2: Is _signal.get_object() really a bool??? %s" % (typeof(signal_object) == TYPE_BOOL))
