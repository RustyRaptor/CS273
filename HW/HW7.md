# CS273 HW 7 - Ziad Arafat

1. ASR on the first byte and ROR on the remaining bytes.
```
CLC 
// R19, R18, R17, R16 

ldi R20, 7     

loop:
        ASR R19
        ROR R18
        ROR R17
        ROR R16
        dec R20 
        cpi R20, 0 
        BRNE loop 
```
---

2. 0x22
```
0x8A
>1000 1010
>0100 0101
>0010 0010
0x22
```
---
3. PROGRAM:
```
// R16< The sequence we are searching in
// R17< 0000 1010
// R18< 0000 1111
// R19< tmporary spot for R16


LDI R17, 0b00001010
LDI R18, 0b00001111


// do it 8 times 
LDI R20, 8

LOOP:
        MOV R19, R16 // Copy R16 to R19
        AND R19, R18 // Remove the front nibble
        CP  R19, R17 // Compare to 1010
                     // Did we find 1010?
        BREQ FOUND
        ROR R16      // shift it right to check the next 4 bits 
        DEC R20 
        cpi R20, 0   
        BREQ NOTFOUND // Did we not find it? 
        JMP LOOP


FOUND: // WE FOUND IT 
        // does something
        jmp FINISH

NOTFOUND: // WE DIDN'T FIND IT 
        // does something else

FINISH:
        ret

```
---
4. The step sizes are
   1. $$\frac{32}{2^{2}} Volts$$
   2. $$\frac{32}{2^{8}}Volts$$
   3. $$\frac{32}{2^{16}}Volts$$

---
5. 
$$Step\ Size=\frac{25.6}{2^{10}}$$ 
$$D_{out} = \frac{V_{in}}{Step\ Size}$$
$$V_{in} = Step\ Size \times D_{out}$$

Therefore:

- $$(\frac{25.6}{2^{10}} \times 215 )Volts$$
- $$(\frac{25.6}{2^{10}} \times 84 )Volts$$
- $$(\frac{25.6}{2^{10}} \times 233 )Volts$$

---
6. Same process as before.
- $$\frac{0.025V}{2^{10}}$$
- $$\frac{4.096V}{2^{10}}$$
- $$\frac{50V}{2^{10}}$$