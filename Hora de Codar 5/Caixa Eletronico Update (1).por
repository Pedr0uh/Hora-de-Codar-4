programa
{   
    inteiro opcao
    cadeia nome
   	real saldo = 150.00// Float

    cadeia extratos[100]
    inteiro numExtratos = 0


	funcao inicio() {

    nomeUser()    
    option()
    
  }

  funcao option(){

  
      escreva("\nEscolha uma opção:\n")
      escreva("1. Ver saldo\n")
      escreva("2. Ver extrato\n")
      escreva("3. Fazer saque\n")
      escreva("4. Fazer deposito\n")
      escreva("5. Fazer transferencia\n")
      escreva("6. Sair\n")
      leia(opcao)

      escreva("\nA opção selecionada foi: " + opcao + "\n")

      escolha(opcao) {

        caso 1:
          verSaldo()
          pare

        caso 2: 
          extrato()
          pare

        caso 3: 
          fazerSaque()
          pare

        caso 4:
          fazerDeposito()
          pare

        caso 5:
          transferencia()
          pare

        caso 6:
          sair()
          pare
        
        caso contrario:
          erro()
          pare

      }

  
  }

  funcao nomeUser(){

    escreva("Como deseja ser chamado(a): ")
    leia(nome)
    escreva("Olá ", nome, " é um prazer te ter por aqui!\n")

  }

	funcao verSaldo(){
	    escreva("Seu saldo atual é: ", saldo, "\n")
	    option()

	}

  funcao extrato(){
    escreva("\n--- Extratos ---\n")

    inteiro i = 0

    se(numExtratos == 0){
      escreva("\nAinda não ouve nenhuma operação\n")
    }
    senao {
      enquanto(i != numExtratos){
        escreva("\n - ", extratos[i])
        i = i + 1
      }
    }

    escreva("\n\n")

    verSaldo()

  }
	
	funcao fazerDeposito(){

		real deposito
		
		escreva("Qual o valor para depósito? ")
		leia(deposito)
		
		se (deposito <= 0){
			escreva("Por favor, informe um número válido.\n")
			fazerDeposito()
		} senao {
			saldo = saldo + deposito
			
      extratos[numExtratos] = "Deposito de R$ " + deposito
      numExtratos = numExtratos + 1

      verSaldo()
		}
	}
	
	funcao fazerSaque(){
	
		real saque
	
		escreva("Qual o valor para saque? ")
		leia(saque)

      se (saque > saldo) {
        escreva("\nOperação não autorizada!\n")
        option()
      }
      senao se (saque <= 0){
        escreva("\nPor favor, informe um número válido.\n")
        fazerSaque()
      }
      senao {
        saldo = saldo - saque

        extratos[numExtratos] = "Saque de R$ " + saque
        numExtratos = numExtratos + 1

        verSaldo()
      }
	}

  funcao transferencia(){

    inteiro conta
    real transferir

    escreva("Insira a conta que deseja fazer a transferencia: ")
    leia(conta)

    escreva("Insira quanto deseja tranferir: ")
    leia(transferir)

    se (transferir > saldo) {
      escreva("Operação não autorizada, saldo insuficiente!")
      option()
    }
    senao se (transferir <= 0) {
      escreva("Operação não autorizada, insira um número valido.")
      transferencia()
    }

    senao {
      saldo = saldo - transferir
      escreva("Tranferencia realizada com sucesso, valor: ", transferir, "\n")

      extratos[numExtratos] = "Transferencia de R$ " + transferir
      numExtratos = numExtratos + 1

    }

    verSaldo()

  }

	funcao erro(){
		escreva("Opção Inválida")
		option()
	}

	funcao sair(){
		escreva("Programa encerrado")
    
	}
}



