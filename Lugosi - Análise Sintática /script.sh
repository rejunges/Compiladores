#!/bin/bash

javacc Lugosi.jj
javac *.java
java Lugosi teste.lug
