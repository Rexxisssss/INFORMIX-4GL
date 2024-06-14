MAIN
    DEFINE a INTEGER
    DEFINE i INTEGER
    DEFINE PESSOAS_NIF ARRAY[10] OF INTEGER
    DEFINE PESSOAS_NOME ARRAY[10] OF CHAR(50)
    DEFINE PESSOAS_VENCIMENTO ARRAY[10] OF MONEY
    DEFINE escolha CHAR(1)
    DEFINE escolha2 CHAR(1)
    DEFINE escolha3 CHAR(1)
    DEFINE aux_nif CHAR(9)
    DEFINE aux_nome CHAR(999)
    DEFINE aux_vencimento CHAR(999)
    DEFINE j INTEGER
    DEFINE k INTEGER
    DEFINE temp1_maiusculas CHAR(50)
    DEFINE temp2_maiusculas CHAR(50)
    DEFINE tamanho INTEGER
    DEFINE soma MONEY
	DEFINE l INTEGER
	LET soma = 0
	LET l = 1
    LET tamanho = 1
    LET k = 0

	WHILE k = 0
	    FOR a = 1 TO 50
			DISPLAY "\n"
		END FOR
	    DISPLAY "\tBEM VINDO:\n\n"
	    WHILE tamanho != 0
			LET i = i + 1

			--INPUT DO NIF COM VERIFICA€?O PARA LETRAS
			WHILE TRUE
				PROMPT "\tInsira o nif: " FOR aux_nif
				LET aux_nif = DOWNSHIFT(aux_nif)
				IF (aux_nif >= 'a' AND aux_nif <= "z") THEN
					DISPLAY "NIF invalido, insira outra vez.\n\n\n"
				ELSE
					EXIT WHILE
				END IF
			END WHILE
			LET PESSOAS_NIF[tamanho] = aux_nif
			
			--INPUT DO NOME COM VERIFICA€?O PARA NUMEROS
			WHILE TRUE
				LET aux_nome = DOWNSHIFT(aux_nome)
				PROMPT "\tInsira o nome: " FOR aux_nome
				LET PESSOAS_NOME[tamanho] = aux_nome
				
				IF (aux_nome <= 0 OR aux_nome >= 999999999999999) THEN
					DISPLAY "Nome Invalido, insira outra vez.\n\n\n"
				ELSE
					EXIT WHILE
				END IF
			END WHILE

			--INPUT DO VENCIENTO COM VERIFICA€?O PARA LETRAS
			WHILE TRUE
				PROMPT "\tInsira o vencimento: " FOR aux_vencimento
				LET PESSOAS_VENCIMENTO[tamanho] = aux_vencimento
				IF (aux_vencimento >= 'a' AND aux_vencimento <= "z") THEN
					DISPLAY "Vencimento Invalido, insira outra vez.\n\n\n"
					CONTINUE WHILE
				ELSE
					EXIT WHILE
				END IF
			END WHILE
			
			--INPUT DA ESCOLHA DE ADICIONAR MAIS UMA PESSOA COM VERIFICA€?O PARA NUMEROS
			WHILE l = 1
				PROMPT "Deseja introduzir mais uma pessoa? s - sim || n - nao: " FOR escolha
				LET escolha = DOWNSHIFT(escolha)
				IF escolha = 's' THEN
					LET tamanho = tamanho + 1
					EXIT WHILE
				END IF
				IF escolha = 'n' THEN
					LET l = 0
				END IF
				IF NOT escolha = 's' OR escolha = 'n' THEN
					DISPLAY "Escolha Invalida\n\n\n"
					CONTINUE WHILE
				END IF
			END WHILE
			IF escolha = 'n' THEN
				EXIT WHILE
			END IF
	    END WHILE
	    
		FOR a = 1 TO 50
			DISPLAY "\n"
		END FOR
		
		--INPUT DA ESCOLHA2 DE ORDENAR OS DADOS COM VERIFICA€?O PARA LETRAS
	    WHILE TRUE	
			PROMPT "Deseja ordenar os dados por Ordem Crescente(1) dos NIFS ou Ordem Alfabetica(2) dos NOMES: " FOR escolha2
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
							
							LET aux_vencimento = PESSOAS_VENCIMENTO[j]
							LET PESSOAS_VENCIMENTO[j] = PESSOAS_VENCIMENTO[j + 1]
							LET PESSOAS_VENCIMENTO[j + 1] = aux_vencimento
						END IF
					END FOR
				END FOR
				EXIT WHILE
			END IF
		
			IF escolha2 = 2 THEN
				FOR i = 1 TO tamanho - 1
					FOR j = 1 TO tamanho - i
						LET temp1_maiusculas = UPSHIFT(PESSOAS_NOME[j])
						LET temp2_maiusculas = UPSHIFT(PESSOAS_NOME[j + 1])
						IF temp1_maiusculas > temp2_maiusculas THEN
							LET aux_nome = PESSOAS_NOME[j]
							LET PESSOAS_NOME[j] = PESSOAS_NOME[j + 1]
							LET PESSOAS_NOME[j + 1] = aux_nome

							LET aux_nif = PESSOAS_NIF[j]
							LET PESSOAS_NIF[j] = PESSOAS_NIF[j + 1]
							LET PESSOAS_NIF[j + 1] = aux_nif
							
							LET aux_vencimento = PESSOAS_VENCIMENTO[j]
							LET PESSOAS_VENCIMENTO[j] = PESSOAS_VENCIMENTO[j + 1]
							LET PESSOAS_VENCIMENTO[j + 1] = aux_vencimento
						END IF
					END FOR
				END FOR
				EXIT WHILE
			END IF

			IF (escolha2 >= 'a' AND escolha2 <= "z") THEN
				DISPLAY "Escolha Invalida\n\n\n"
			END IF
		END WHILE

		FOR a = 1 TO 50
			DISPLAY "\n"
		END FOR

	    DISPLAY "         NIF NOME                                                       VENCIMENTO"
	    DISPLAY "____________ __________________ __________________________________________________"

	    FOR i = 1 TO tamanho
		    DISPLAY " ", PESSOAS_NIF[i]," ", PESSOAS_NOME[i], PESSOAS_VENCIMENTO[i]
			LET soma = soma + PESSOAS_VENCIMENTO[i]
	    END FOR
	    DISPLAY "____________ __________________ __________________________________________________"
        
        DISPLAY "                                TOTAL DOS VENCIMENTOS:         ", soma
        
        LET k = k + 1
	    
		--INPUT DA ESCOLHA3 DE REPETIR O PROGRAMA COM VERIFICA€?O PARA LETRAS
		WHILE TRUE
			PROMPT "Deseja Repetir o Programa? 1- SIM 2- NAO: " FOR escolha3
			IF escolha3 = 1 THEN
				LET PESSOAS_NIF[i] = 0
				LET PESSOAS_NOME[i] = ""
				LET PESSOAS_VENCIMENTO[i] = 0
				LET tamanho = 1
				LET soma = 0
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
			IF (escolha3 >= 'a' AND escolha3 <= "z") THEN
				DISPLAY "Escolha Invalida\n\n\n"
			END IF
		END WHILE
		IF escolha3 = 2 THEN
			EXIT WHILE
		END IF
	END WHILE
END MAIN
