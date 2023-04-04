extends Control

var _signal: Signal

func _ready():
	_signal = $Button.pressed
	if is_instance_valid(_signal.get_object()) and (_signal.get_object() is Node):
		print("_ready: issue not reproduced") # if you see this message it's either fixed or I'm full of it
	else:
		# output parts of the if expression and to do some sanity checks
		print("_ready: issue reproduce (expected)")
		print("_ready: is_instance_valid(_signal.get_object()) evalutes to %s" % is_instance_valid(_signal.get_object()))
		print("_ready: _signal.get_object() is Node evalutes to %s" % _signal.get_object() is Node)
		print("_ready: _signal.get_object() evalutes to %s" % _signal.get_object())
		print("_ready: typeof(_signal.get_object()) == TYPE_BOOL ?? %s" % (typeof(_signal.get_object()) == TYPE_BOOL))
