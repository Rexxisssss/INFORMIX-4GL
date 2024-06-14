GLOBALS
	DEFINE pessoa ARRAY[20] OF RECORD
        nif INTEGER,
        nome CHAR(50),
        vencimento MONEY
    END RECORD
	DEFINE tamanho INTEGER
END GLOBALS


MAIN
    DEFINE a INTEGER
    DEFINE i INTEGER
    DEFINE escolha CHAR(1)
    DEFINE escolha2 CHAR(1)
    DEFINE escolha3 CHAR(1)
    DEFINE aux_nif CHAR(9)
    DEFINE aux_nome CHAR(999)
    DEFINE aux_vencimento CHAR(999)
    DEFINE j INTEGER
    DEFINE k INTEGER
    DEFINE l INTEGER    
    LET l = 1
    LET k = 0
	LET tamanho = 1

    WHILE k = 0  
	    CALL cls()
	    DISPLAY "\tBEM VINDO:\n\n"
	    LET i = 1
		WHILE tamanho != 0

            CALL input_PESSOA(i)
			WHILE TRUE
				PROMPT "Deseja introduzir mais uma pessoa? s - sim || n - nao: " FOR escolha
				LET escolha = DOWNSHIFT(escolha)
				IF escolha = 's' THEN
					LET tamanho = tamanho + 1
					EXIT WHILE
				END IF
				IF escolha = 'n' THEN
					EXIT WHILE
				END IF
				IF NOT escolha = 's' OR escolha = 'n' THEN
					DISPLAY "Escolha Invalida\n\n\n"
					CONTINUE WHILE
				END IF
			END WHILE
			IF escolha = 'n' THEN
				EXIT WHILE
			END IF
			LET i = i + 1
	    END WHILE

		CALL cls()
		CALL BUBBLE_SORT(i)
		CALL tabela(i)

        LET k = k + 1
	    
		--INPUT DA ESCOLHA3 DE REPETIR O PROGRAMA COM VERIFICA€?O PARA LETRAS
		WHILE TRUE
			PROMPT "Deseja Repetir o Programa? 1- SIM 2- NAO: " FOR escolha3
			IF escolha3 = 1 THEN
                LET pessoa[i].nif = 0
				LET pessoa[i].nome = ""
				LET pessoa[i].vencimento = 0
				LET tamanho = 1
				LET k = k - 1
				LET l = 1
				LET escolha = ""
				LET escolha2 = ""
				LET escolha3 = ""
                EXIT WHILE
			END IF
			IF escolha3 = 2 THEN
				EXIT WHILE
			END IF
			IF is_letra(escolha3) THEN
				DISPLAY "Escolha Invalida\n\n\n"
			END IF
		END WHILE
	END WHILE
END MAIN

FUNCTION cls()
	DEFINE i INTEGER
	FOR i = 1 TO 50
			DISPLAY "\n"
		END FOR
END FUNCTION

FUNCTION tabela(i)
	DEFINE soma MONEY
	DEFINE i INTEGER
	LET soma = 0
	CALL cls()
	DISPLAY "         NIF NOME                                                       VENCIMENTO"
	DISPLAY "____________ __________________ __________________________________________________"

	FOR i = 1 TO tamanho
		DISPLAY " ", pessoa[i].nif," ", pessoa[i].nome, pessoa[i].vencimento
		LET soma = soma + pessoa[i].vencimento
	END FOR
	DISPLAY "____________ __________________ __________________________________________________"    
    DISPLAY "                                TOTAL DOS VENCIMENTOS:         ", soma
	LET soma = 0
END FUNCTION

FUNCTION BUBBLE_SORT(tamanho)
	DEFINE tamanho INTEGER
	DEFINE i INTEGER
	DEFINE j INTEGER
	DEFINE escolha2 CHAR(1)
	DEFINE aux_nif CHAR(20)
	DEFINE aux_nome CHAR(20)
	DEFINE aux_vencimento CHAR(20)
	DEFINE temp1_maiusculas CHAR(50)
    DEFINE temp2_maiusculas CHAR(50)

		
	WHILE TRUE
		PROMPT "Deseja ordenar os dados por Ordem Crescente(1) dos NIFS ou Ordem Alfabetica(2) dos NOMES: " FOR escolha2
			IF escolha2 = 1 THEN
				FOR i = 1 TO tamanho - 1
					FOR j = 1 TO tamanho - i
						IF pessoa[j].nif > pessoa[j + 1].nif THEN
							LET aux_nif = pessoa[j].nif
							LET pessoa[j].nif = pessoa[j + 1].nif
							LET pessoa[j + 1].nif = aux_nif
							LET aux_nome = pessoa[j].nome
							LET pessoa[j].nome = pessoa[j + 1].nome
							LET pessoa[j + 1].nome = aux_nome
							
							LET aux_vencimento = pessoa[j].vencimento
							LET pessoa[j].vencimento = pessoa[j + 1].vencimento
							LET pessoa[j + 1].vencimento = aux_vencimento
						END IF
					END FOR
				END FOR
				EXIT WHILE
			END IF
			
			IF escolha2 = 2 THEN
				FOR i = 1 TO tamanho - 1
					FOR j = 1 TO tamanho - i
						LET temp1_maiusculas = UPSHIFT(pessoa[j].nome)
						LET temp2_maiusculas = UPSHIFT(pessoa[j + 1].nome)
						IF temp1_maiusculas > temp2_maiusculas THEN
							LET aux_nome = pessoa[j].nome
							LET pessoa[j].nome = pessoa[j + 1].nome
							LET pessoa[j + 1].nome = aux_nome
				
							LET aux_nif = pessoa[j].nif
							LET pessoa[j].nif = pessoa[j + 1].nif
							LET pessoa[j + 1].nif = aux_nif
							LET aux_vencimento = pessoa[j].vencimento
							LET pessoa[j].vencimento = pessoa[j + 1].vencimento
							LET pessoa[j + 1].vencimento = aux_vencimento
						END IF
					END FOR
				END FOR
				EXIT WHILE
			END IF
			IF is_letra(escolha2) THEN
				DISPLAY "Escolha Invalida\n\n\n"				
			END IF
	END WHILE
END FUNCTION

FUNCTION input_PESSOA(i)

	DEFINE i INTEGER
    DEFINE i_nif CHAR(9)
    DEFINE i_nome CHAR(999)
    DEFINE i_vencimento CHAR(999)

        WHILE TRUE
            PROMPT "Insira o NIF: " FOR i_nif
            LET i_nif = DOWNSHIFT(i_nif)
            IF is_numero(i_nif) THEN
                DISPLAY "input invalido\n\n\n"
            ELSE
				EXIT WHILE
            END IF
        END WHILE

        WHILE TRUE
            PROMPT "Insira o NOME: " FOR i_nome
            LET i_nome = DOWNSHIFT(i_nome)
            IF NOT is_letra(i_nome) THEN
                DISPLAY "input invalido\n\n\n"
            ELSE
				EXIT WHILE
            END IF
        END WHILE

        WHILE TRUE
            PROMPT "Insira o VENCIMENTO: " FOR i_vencimento
            LET i_vencimento = DOWNSHIFT(i_vencimento)
            IF is_numero(i_vencimento) THEN
                DISPLAY "input invalido\n\n\n"
            ELSE
				EXIT WHILE
            END IF
        END WHILE
        LET pessoa[i].nif = i_nif
    	LET pessoa[i].nome = i_nome
    	LET pessoa[i].vencimento = i_vencimento
END FUNCTION


FUNCTION is_letra(p_str)
	DEFINE p_str CHAR(20)
	
	DEFINE tamanho INTEGER
	DEFINE i INTEGER
	
	LET p_str = DOWNSHIFT(p_str)
	LET tamanho = LENGTH(p_str)
	FOR i = 1 TO tamanho
		IF NOT (p_str[i] >= 'a' AND p_str[i] <= 'z') THEN
			RETURN FALSE
		END IF
	END FOR	
	
	RETURN TRUE
END FUNCTION

FUNCTION is_numero(p_int)
	DEFINE p_int CHAR(20)

	DEFINE tamanho INTEGER
	DEFINE i INTEGER

	LET tamanho = LENGTH(p_int)
	FOR i = 1 TO tamanho
		IF (p_int[i] >= 'a' AND p_int[i] <= 'z') THEN
			RETURN TRUE
		END IF
	END FOR

	RETURN FALSE
END FUNCTION
