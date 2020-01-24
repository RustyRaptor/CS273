
#
# Global data (x1, x2, and x3)
#
    .data
    .comm x1,1
    .global x1
    .comm x2,1
    .global x2
    .comm x3,1
    .global x3

#
# Program code (addition function)
#
    .text
    .global addition
addition:
    lds  r18, x1
    lds  r19, x2
    lds  r20, x3
    add  r18, r19
    add  r18, r20
    sts  x3, r18
    ret
    
