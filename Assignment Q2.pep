;The next few lines input an integer
         STRO input, d
         DECI int, d 

;If the number is zero or one, the game is over so branch to the end
start:   LDA int, d
         SUBA 0x01, i
         BREQ end

;Check if the number is odd
;by using an AND gate between the integer and 1
;if it returns the value 1, then the number is odd
;if it returns zero then the number is even

         LDA int, d
         DECO int, d
         ANDA 1, i
         STA msb,d
         DECO msb, d
         BREQ even

;perform odd number calculation ((3 x int) + 1) and loop to the begining
         STA sum, d
         ADDA int, d
         ADDA int, d
         ADDA int, d
         ADDA 0x01, i
         STA int, d

         BR start
         
;if the number is even, divide it by 2 and loop to the start
even:    LDA int, d
         ASRA
         STA int, d
         DECO int, d
         BR  start 
         LDA int, d  
    
end:     DECO int, d   
         STRO End, d

         STOP


End:   .ASCII "\nEnd\x00"
int:   .BLOCK 2 
input: .ASCII "Input a number"
msb:   .BLOCK 2 ;Most Significant Bit
sum:   .BLOCK 2

         .END