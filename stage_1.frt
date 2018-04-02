: is_even 2 % not ;

: is_prime dup 2 < if drop 0
					else dup 4 < if drop 1 exit
								else 1 
								repeat 1 + over over % not if 
									drop drop 0 exit then over 1 - over =
								until then drop drop 1
					then ;

	
: memory_prime is_prime	1 cells allot dup -rot ! ;

: cat dup count rot dup count rot over + heap-alloc rot swap dup rot string-copy dup rot + rot string-copy ;

: next_prime
	dup 1 < 
			if drop 2
			else repeat 1 + dup is_prime until 
			then ;

: primarity
	0 
	repeat
		next_prime over over %	( n p n mod p )
		0 = if dup rot swap / swap over 1 = ( if n mod p == 0 [n = n / p] )
					if drop drop 1 exit ( if n == 1 return 1 )
					else over over % 0 = if drop drop 0 exit then ( else if n mod p == 0 return 0 )
					then
			then
			over 1 = 
	until
	drop drop 1 ;								