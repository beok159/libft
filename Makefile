NAME = libft.a

FILE =	ft_tolower.c ft_toupper.c ft_isalnum.c ft_isalpha.c ft_isascii.c \
   		ft_isdigit.c ft_isprint.c ft_strlen.c ft_memset.c ft_memcpy.c \
      	ft_memmove.c ft_memchr.c ft_memcmp.c ft_bzero.c ft_strdup.c \
       	ft_atoi.c ft_strchr.c ft_strlcat.c ft_strlcpy.c ft_strrchr.c \
       	ft_strncmp.c ft_strnstr.c ft_calloc.c ft_putchar_fd.c \
       	ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_strjoin.c \
       	ft_substr.c ft_strtrim.c ft_itoa.c ft_split.c ft_strmapi.c \
      	ft_striteri.c

BFILE =	ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c ft_lstlast_bonus.c ft_lstadd_back_bonus.c \
			ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c

CFLAGS = -Wall -Wextra -Werror
CC = cc

INC_DIR = include
SRC_DIR = src
OBJ_DIR = obj

SRC = $(addprefix $(SRC_DIR)/, $(FILE))
OBJ = $(addprefix $(OBJ_DIR)/, $(FILE:%.c=%.o))
OBJB = $(addprefix $(OBJ_DIR)/, $(BFILE:%.c=%.o))

.PHONY:	clean fclean re bonus

all:	$(NAME)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(NAME): $(OBJ)
	ar -rc $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR)
	$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

bonus: $(OBJ) $(OBJB)
	ar -rc $(NAME) $^

clean:
	rm -f $(OBJ)
	rm -rf $(OBJB)
	rm -rf $(OBJ_DIR)

fclean:	clean
	rm -f $(NAME)

re: fclean all