PALAVRA_RESERVADA  "main"|"if"|"while"|"do"|"return"|"print"|"function"
ABRE_PARENTESES	"("
FECHA_PARENTESES ")"
ABRE_CHAVES	"{"
FECHA_CHAVES	"}"
PONTO_VIRGULA	";"
TIPO	"int"|"bool"
ATRIBUICAO	":="
BOOLEANO	"true"|"false"
OPERADOR	"+"|"-"|"*"|"/"|"&&"|"||"|"<"|">"|"=="
VIRGULA 	","
DIGITO  [0-9]
DIGITOS {DIGITO}+
LETRA   [a-zA-Z]
FACAO_OPCIONAL	("."{DIGITO})?
EXPOENTE_OPCIONAL	("E"("+"|"-")?{DIGITOS})?
TOKEN_ID	{LETRA}({LETRA}|{DIGITOS})*"_"*
TOKEN_NUM_LITERAL	{DIGITO}{FACAO_OPCIONAL}{EXPOENTE_OPCIONAL}

%%
{PALAVRA_RESERVADA}	{printf("PALAVRA_RESERVADA: %s\n", yytext);}
{ABRE_PARENTESES}	{printf("ABRE_PARENTESES: %s\n", yytext);}	
{FECHA_PARENTESES}	{printf("FECHA_PARENTESES: %s\n", yytext);}	
{ABRE_CHAVES}	{printf("ABRE_CHAVES: %s\n", yytext);}	
{FECHA_CHAVES}	{printf("FECHA_CHAVES: %s\n", yytext);}	
{PONTO_VIRGULA}	{printf("PONTO_VIRGULA: %s\n", yytext);}	
{TIPO}	{printf("TIPO: %s\n", yytext);}		
{ATRIBUICAO}	{printf("ATRIBUICAO: %s\n", yytext);}		
{BOOLEANO}	{printf("BOOLEANO: %s\n", yytext);}		
{OPERADOR}	{printf("OPERADOR: %s\n", yytext);}		
{VIRGULA}	{printf("VIRGULA: %s\n", yytext);}		
{TOKEN_ID}	{printf("TOKEN_ID: %s\n", yytext);}
{TOKEN_NUM_LITERAL}	{printf("TOKEN_NUM_LITERAL: %s\n", yytext);}

%%

int yywrap();

main(){
    yylex();
}

int yywrap(){
    return 1;
}