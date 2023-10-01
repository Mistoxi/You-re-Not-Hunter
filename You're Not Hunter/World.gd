extends Node2D


func nor(bool1 : bool, bool2 : bool):
	if bool1 or bool2 :
		return false
	else :
		return true


func xor(bool1 : bool, bool2 : bool):
	if bool1 or bool2 :
		if bool1 and bool2 :
			return false
		else :
			return true


func xnor(bool1 : bool, bool2 : bool):
	if !bool1 or !bool2 :
		if !bool1 and !bool2 :
			return false
		else :
			return true


func nand(bool1 : bool, bool2 : bool):
	if bool1 and bool2 :
		return false
	else :
		return true
