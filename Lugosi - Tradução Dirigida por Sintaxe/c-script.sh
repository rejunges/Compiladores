#!/bin/bash

javacc Lugosi-c.jj
javac *.java
#java Lugosi arq
#java Lugosi teste.lug
java Lugosi teste1.lug > teste1.c
gcc teste1.c -o t
./t
#java Lugosi teste2.lug
#java Lugosi teste3.lug
#java Lugosi teste4.lug
