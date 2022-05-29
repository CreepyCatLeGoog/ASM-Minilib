##
## EPITECH PROJECT, 2021
## B-ASM-400-MPL-4-1-asmminilibc-raphael.risser
## File description:
## Makefile
##

ASM = nasm

CC = gcc

RM = rm -f

ASFLAGS = -f elf64

NAME = libasm.so

SRCS =	src/strlen.asm \
		src/strchr.asm\
		src/memset.asm \
		src/memcpy.asm \
		src/strcmp.asm \
		src/memmove.asm \
		src/rindex.asm \
		src/strncmp.asm \
		src/strcspn.asm \
		src/strcasecmp.asm

OBJS =	$(SRCS:.asm=.o)

T_OBJS =	$(T_SRCS:.c=.o)

all:	$(NAME)

$(NAME):	$(OBJS)
		$(CC) -nostdlib -shared -fPIC $(OBJS) -o $(NAME)

%.o : %.asm
	$(ASM) $(ASFLAGS) -o $@ $<

clean:
	$(RM) src/*.o

fclean:	clean
	$(RM) src/*.o
	$(RM) libasm.so

re:	fclean all