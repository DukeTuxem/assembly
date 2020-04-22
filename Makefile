CC	=	gcc

CFLAGS	+=	-W -Wall -Werror -g -g3

ASM	=	nasm

ASFLAGS	+=	-felf64

LIBNAME	=	libasm.so

SRC	=	src

SRCS	=	$(SRC)/strlen.S		\
		$(SRC)/strchr.S		\
		$(SRC)/memset.S		\
		$(SRC)/memcpy.S		\
		$(SRC)/memmove.S	\
		$(SRC)/rindex.S		\
		$(SRC)/strcasecmp.S	\
		$(SRC)/strcmp.S		\
		$(SRC)/strncmp.S	\
		$(SRC)/strstr.S		\
		$(SRC)/strcspn.S	\
		$(SRC)/strpbrk.S

OBJS	=	$(SRCS:.S=.o)

all:		$(LIBNAME) $(SRCS)

$(LIBNAME):	$(OBJS)
		$(CC) $(CFLAGS) -shared $(OBJS) -o $@

%.o: 		%.S
		$(ASM) $(ASFLAGS) $< -o $@

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(LIBNAME)

re:		fclean all

.PHONY:		all $(LIBNAME) clean fclean re
