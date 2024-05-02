MAIN
	DEFINE numeros ARRAY[10] OF INTEGER
	DEFINE i INTEGER
	DEFINE j INTEGER
	DEFINE v INTEGER
	
	DISPLAY "Insira 10 numeros inteiros: "
	
	FOR i = 1 to 10
		PROMPT "Insira o numero ", i, ": " FOR numeros[i]

	END FOR
	DISPLAY "Os números ordenados em ordem crescente são:"
	
	FOR i = 1 to 10-1
		FOR j = 1 to 10 - i - 1 
			IF numeros[j] > numeros[j + 1] THEN
				v = numeros[j]
				numeros[j] = numeros[j + 1]
				numeros[j + 1] = v
			END IF
		END FOR
	END FOR
	
	FOR i = 1 to 10
		
    		DISPLAY numeros[i]
	END FOR
END MAIN
