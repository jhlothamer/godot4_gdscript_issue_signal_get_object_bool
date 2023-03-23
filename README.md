# Godot 4 Project - Reproduce Signal.get_object() Returns Bool Issue
This Godot 4 project reproduces an issue I found with calling the get_object() method of a signal inside an if statement expression where it returns a bool value.  After that, it continues to evaluate to bool.

Also demonstrated is that if the get_object() method is called before using it's return value in an if statement, it returns the expected object.

This is done using a button, and two timers.  The button is just used as a signal source and because it's a node.  This mimics the conditions and code I original found the issue with.

The timer timeout handler functions demonstrate the issue (Timer1) and the very simple work around (Timer2).

The issue is not that it's hard to work around.  It's that it's very odd that the Signal.get_object() method returns a bool ever and makes me wonder if there are some more problematic issues going on.