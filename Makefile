# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fpedroso <fpedroso@student.42lisboa.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/07 09:44:58 by fpedroso          #+#    #+#              #
#    Updated: 2024/11/08 13:36:28 by fpedroso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
CC = cc
CFLAGS = -Wextra -Wall -Werror
SRC = $(MANDATORY)
OBJ = $(SRC:.c=.o)

TEST = test

SRCSBONUS = $(BONUS)
OBJSBONUS = $(SRCSBONUS:.c=.o)

MANDATORY = \
	ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
	ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c \
	ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c \
	ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c \
	ft_calloc.c ft_strdup.c \
	ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c \
	ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \


BONUS = \
	ft_lstnew.c \
	ft_lstadd_front.c \
	ft_lstsize.c \
	ft_lstlast.c \
	ft_lstadd_back.c \
	ft_lstdelone.c \
	ft_lstclear.c \
	ft_lstiter.c \
	ft_lstmap.c \
	

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

clean:
	rm -f $(OBJ) $(TEST)
	rm -f $(OBJSBONUS)

bonus:	$(OBJS) $(OBJSBONUS)
	ar rcs $(NAME) $(OBJS) $(OBJSBONUS)

fclean: clean
	rm -f $(NAME)

oblit:
	find . \( -type f -o -type d \) \
    ! -name "*.c" \
    ! -name "libft.h" \
    ! -name "Makefile" \
	! -name "." \
	! -name ".." \
    -exec rm -rf {} +

re: fclean all

test: $(OBJ) $(OBJSBONUS)
	$(CC) $(CFLAGS) $(OBJ) $(OBJSBONUS) -o $(TEST)

.PHONY: all clean fclean re test