#!/bin/bash

flex lugosi.l
gcc lex.yy.c
./a.out < arq