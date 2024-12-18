NAME = libasm.a
EXEC = test

ASM_SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
C_SRC = main.c

ASM_OBJ = $(ASM_SRC:.s=.o)
C_OBJ = $(C_SRC:.c=.o)

CC = gcc
ASM = nasm
ASM_FLAGS = -f elf64 
CFLAGS = -Wall -Wextra -Werror

all: $(NAME) $(EXEC)

$(NAME): $(ASM_OBJ)
	ar rcs $(NAME) $(ASM_OBJ) 
$(EXEC): $(NAME) $(C_OBJ) 
	$(CC) $(CFLAGS) -o $(EXEC) $(C_OBJ) -L. -lasm

%.o: %.s
	$(ASM) $(ASM_FLAGS) $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(ASM_OBJ) $(C_OBJ)

fclean: clean
	rm -f $(NAME) $(EXEC)

re: fclean all

