#---------------------------------------------------------------------
# CSE 131 Reduced-C Compiler Project
# Copyright (C) 2008-2015 Garo Bournoutian and Rick Ord
# University of California, San Diego
#---------------------------------------------------------------------

JAVACUP=$(PUBLIC)/Users/FreeQinC/Dropbox/UCSD/Y4Q1/CSE131/cse131-proj1-jeqin/lib/java-cup-v11a.jar

SOURCES:sh = find src -type f -name '*.java' ! -name 'RC.java'

bin/%.class : src/%.java
	@mkdir -p bin
	javac -classpath $(JAVACUP) -d bin -sourcepath src $<

#First target is the default target if "make" is run without a target
new:
	make clean
	make rc

rc: src/parser.java bin/RC.class $(SOURCES:src/%.java=bin/%.class)
	chmod +x RC

CC=cc
compile:
	$(CC) rc.s $(PUBLIC)/input.c $(PUBLIC)/output.s $(LINKOBJ)

src/parser.java: src/rc.cup
	cd src; java -jar $(JAVACUP) < rc.cup

# DON'T
# FORGET
# TO
# CHANGE
# THIS
clean:
	cd src; rm -f *.class parser.java sym.java *.o
	rm -f a.out
	> rc.s
	rm -rf bin/
