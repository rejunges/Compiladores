import sys 

operacoes = ['SUB', 'SUM', 'DIV', 'MULT']
stack = [] #inicializa a pilha

with open(sys.argv[1], 'r') as arq: #Leitura do arquivo passado na linha de comando
    linha = arq.readline()
    
    #Le linha por linha até terminar o arquivo
    while(linha):
        comando = linha.split(' ')[0] #Separa o comando PUSH do seu numero
        comando = comando.replace("\n", "") #remove o quebra linha se houver (demais comandos)
        
        if comando == 'PUSH':
            numero = linha.split(' ')[1] 
            stack.append(int(numero)) #adiciona numero na pilha
        
        if comando in operacoes:
            arg1 = stack.pop() #Remove da pilha o primeiro numero
            arg2 = stack.pop() #Remove da pilha o segundo numero

            if comando == 'SUB':
                stack.append(arg2 - arg1)
            elif comando == 'SUM':
                stack.append(arg1 + arg2) 
            elif comando == 'MULT':
                stack.append(arg1 * arg2)
            elif comando == 'DIV':
                stack.append(arg2 / arg1)
        
        print("Operação: {} \nO estado atual da pilha é: {}\n" .format(comando, stack)) #Exibe a pilha na tela 
        
        if comando == 'PRINT':
            print("Resultado final da pilha: {}" .format(stack[0]));
        
        linha = arq.readline()

arq.close() #fecha arquivo
