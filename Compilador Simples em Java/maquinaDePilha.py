import sys 

operacoes = ['SUB', 'SUM', 'DIV', 'MULT']
stack = []
teste = []
with open(sys.argv[1], 'r') as arq: #Leitura do arquivo passado na linha de comando
    linha = arq.readline()
    
    #Le linha por linha até terminar o arquivo
    while(linha):
        comando = linha.split(' ')[0]
        
        if comando == 'PUSH':
            numero = linha.split(' ')[1]
            stack.append(int(numero))
        
       ''' else:
            comando.split('\n')[0] #remove o quebra linha
        teste.append(comando)
        print(teste)
        if comando == 'MULT':
              print('aqui')
        '''
        print(stack)
        linha = arq.readline()

arq.close() #fecha arquivo
