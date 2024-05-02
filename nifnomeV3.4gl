MAIN
    DEFINE a INTEGER
    DEFINE i INTEGER
    DEFINE PESSOAS_NIF ARRAY[10] OF INTEGER
    DEFINE PESSOAS_NOME ARRAY[10] OF CHAR(50)
    DEFINE escolha CHAR(1)
    DEFINE escolha2 INTEGER
    DEFINE escolha3 INTEGER
    DEFINE aux_nif INTEGER
    DEFINE aux_nome CHAR(50)
    DEFINE j INTEGER
    DEFINE k INTEGER
    DEFINE tamanho INTEGER
    LET tamanho = 1
    LET k = 0

	WHILE k = 0
	    	FOR a = 1 TO 20
			DISPLAY "\n"
		END FOR
	    DISPLAY "\tBEM VINDO:\n\n"
	    FOR i = 1 TO tamanho
		PROMPT "\tInsira o nif: " FOR aux_nif
		IF aux_nif < 100000000 OR aux_nif > 999999999 THEN
			DISPLAY "NIF invalido"
			EXIT FOR
		END IF
		LET PESSOAS_NIF[tamanho] = aux_nif
		PROMPT "\tInsira o nome: " FOR aux_nome
		LET PESSOAS_NOME[tamanho] = aux_nome
		PROMPT "Deseja introduzir mais uma pessoa? S - sim || N - nao: " FOR escolha
		CASE (escolha)
		    WHEN 'S'
		        LET tamanho = tamanho + 1
		    WHEN 'N'
		        EXIT FOR
		END CASE
	    END FOR
	    
		FOR a = 1 TO 20
			DISPLAY "\n"
		END FOR
		
	    PROMPT "Deseja organizar os dados por Ordem Crescente(1) dos NIFS ou Ordem Alfabetica(2) dos NOMES: " FOR escolha2
	    IF escolha2 = 1 THEN
		FOR i = 1 TO tamanho - 1
		    FOR j = 1 TO tamanho - i
		        IF PESSOAS_NIF[j] > PESSOAS_NIF[j + 1] THEN
		            LET aux_nif = PESSOAS_NIF[j]
		            LET PESSOAS_NIF[j] = PESSOAS_NIF[j + 1]
		            LET PESSOAS_NIF[j + 1] = aux_nif

		            LET aux_nome = PESSOAS_NOME[j]
		            LET PESSOAS_NOME[j] = PESSOAS_NOME[j + 1]
		            LET PESSOAS_NOME[j + 1] = aux_nome
		        END IF
		    END FOR
		END FOR
	    END IF

	    IF escolha2 = 2 THEN
		FOR i = 1 TO tamanho - 1
		    FOR j = 1 TO tamanho - i
		        IF PESSOAS_NOME[j] > PESSOAS_NOME[j + 1] THEN
		            LET aux_nome = PESSOAS_NOME[j]
		            LET PESSOAS_NOME[j] = PESSOAS_NOME[j + 1]
		            LET PESSOAS_NOME[j + 1] = aux_nome

		            LET aux_nif = PESSOAS_NIF[j]
		            LET PESSOAS_NIF[j] = PESSOAS_NIF[j + 1]
		            LET PESSOAS_NIF[j + 1] = aux_nif
		        END IF
		    END FOR
		END FOR
	    END IF

		FOR a = 1 TO 20
			DISPLAY "\n"
		END FOR
		
	    DISPLAY "          NIF NOME"
	    DISPLAY "_____________ _________________"

	    FOR i = 1 TO tamanho
		DISPLAY "  ", PESSOAS_NIF[i], " ", PESSOAS_NOME[i] 
	    END FOR
	    DISPLAY "_____________ _________________"
	    LET k = k + 1
	    PROMPT "Deseja Repetir o Programa? 1- SIM 2- NAO: " FOR escolha3
	    IF escolha3 = 1 THEN
	    	LET k = k - 1
	    END IF
	    IF escolha3 = 2 THEN
	    	EXIT WHILE
	    END IF
	END WHILE
END MAIN

