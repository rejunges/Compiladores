#!/bin/bash

javacc Lugosi-c.jj
javac *.java
#java Lugosi arq
#java Lugosi teste.lug
java Lugosi teste1.lug 
gcc teste1.c -o t
./t
#java Lugosi teste2.lug
#java Lugosi teste2.lug > teste2.c
#gcc teste2.c -o t
#./t
#java Lugosi teste3.lug
#java Lugosi teste4.lug
