import java.io.*;

enum TokenType{ NUM,SOMA, MULT, SUB, DIV, APar,FPar, EOF}

class Token{
  String lexema;
  TokenType token;

 Token (String l, TokenType t)
 	{ lexema=l;token = t;}	

}

class AnaliseLexica {

	BufferedReader arquivo;
	static char anterior; //Usa anterior pra pegar o primeiro char pós número


	AnaliseLexica(String a) throws Exception
	{
		
	 	this.arquivo = new BufferedReader(new FileReader(a));
		this.anterior = 'a';
	}

	Token getNextToken() throws Exception
	{	
		Token token;
		int eof = -1;
		char currchar;
		int currchar1;
		String lexema = "";

			
			if (anterior == 'a'){
				//Se o anterior está vazio, significa que a última coisa lida não foi um número e que pode continuar a leitura do arquivo
				do{
					currchar1 =  arquivo.read();
					currchar = (char) currchar1;
				} while (currchar == '\n' || currchar == ' ' || currchar =='\t' || currchar == '\r');
			}
			else{
				//Se não, significa que o último token foi um número e leu-se um caracter a mais, coloca o caracter a mais(anterior) no char corrent
				currchar = anterior;
				currchar1 = currchar;
			}

			if(currchar1 != eof && currchar1 !=10){
								
				if (currchar >= '0' && currchar <= '9'){
					//Faz a leitura de um número
					while(currchar >= '0' && currchar <= '9'){
						lexema += currchar;
						currchar1 = arquivo.read();
						currchar = (char) currchar1;
					}
					//A leitura acaba quando o char lido não é um digito (logo, é um operador)
					anterior = currchar; //Este char é armazenado em anterior para não perder o valor do que foi lido
					
					return (new Token (lexema, TokenType.NUM));
				}
				else{
					//Atualiza currchar com o anterior se este foi usado anteriormente (na leitura do número)
					if(anterior != 'a') currchar =  anterior;
					anterior = 'a'; //Limpa anterior
					lexema += currchar;
					switch (currchar){
						case '(':
							return (new Token (lexema,TokenType.APar));
						case ')':
							return (new Token (lexema,TokenType.FPar));
						case '+':
							return (new Token (lexema,TokenType.SOMA));
						case '*':
							return (new Token (lexema,TokenType.MULT));
						case '-':
							return (new Token (lexema,TokenType.SUB));
						case '/':
							return (new Token (lexema,TokenType.DIV));

						
						default: throw (new Exception("Caractere inválido: " + (currchar)));
					}
				}
			}

			arquivo.close();
		
		return (new Token(lexema,TokenType.EOF));
		
	}
}
