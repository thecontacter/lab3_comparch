TARGET = MyProject
CC = gcc

SRC = $(wildcard *.c)
OBJ = $(patsubst %.c, %.o, $(SRC))
LIB = libMyProdlib.a

SRC_LIB = my_lib.c
OBJ_LIB = $(patsubst %.c, %.o, $(SRC_LIB))

.PHONY: all clean

all: $(TARGET) $(LIB)

$(TARGET) : $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

$(LIB) : $(OBJ_LIB)
	ar rcs $@ $^

%.o : %.c
	$(CC) -c $< -o $@

clean :
	rm $(TARGET) *.o
	
