; R18: x
; R19: y
; R20: 2
; R21: 5
; R22: 7

conditionals:
	ldi R18, 5
	ldi R19, -5

	cp R18, R19
	breq elseif
	cp R18, R19
	breq


	cp R19, R18
	brlt if
	dec R19
	dec R19
	dec R19
	cp R19, R18
	brlt elseif
	jmp else

if:
	ldi R20, 2
	add R18, R20
	lds R19, R18
	jmp done
elseif:
	ldi R21, 5
	add R18, R21
	lds R19, R18
	jmp done
else:
	ldi R22, 7
	add R18, R22
	lds R19, R18

done:
	ret