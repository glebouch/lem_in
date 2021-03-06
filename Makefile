# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: brvalcas <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/30 23:28:47 by brvalcas          #+#    #+#              #
#    Updated: 2018/11/30 23:28:47 by brvalcas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = lem-in

SRC =	srcs/main.c\
		srcs/parsing.c\
		srcs/affichage.c\
		srcs/list_chain.c\
		srcs/algo.c

LIB = ./libft/libft.a

OBJ = $(SRC:.c=.o)

INCLUDES = includes

CFLAGS = -Wall -Wextra -Werror -I $(INCLUDES)

CC = gcc

arg = 0
arg_2 = 0
arg_3 = 0

all : $(NAME)

$(NAME) : $(OBJ)
	@make -C libft
	$(CC) $(CFLAGS) -o $@ $^ $(LIB)

%.o : %.c
	$(CC) -o $@ -c $< $(FLAGS) -I $(INCLUDES)

exe : $(NAME)
ifeq ($(arg), correct)
	./lem-in < resources/correct_1
	@read $VAR
	./lem-in < resources/correct_2
	@read $VAR
	./lem-in < resources/correct_3
	@read $VAR
	./lem-in < resources/correct_4
	@read $VAR
	./lem-in < resources/correct_5
else
	./lem-in < srcs
	./lem-in < lem-in
	./lem-in < auteur
	@read $VAR
	./lem-in < resources/error_1
	./lem-in < resources/error_2
	./lem-in < resources/error_3
	./lem-in < resources/error_4
	./lem-in < resources/error_5
	@read $VAR
	./lem-in < resources/error_6
	./lem-in < resources/error_7
	./lem-in < resources/error_8
	./lem-in < resources/error_9
	./lem-in < resources/error_10
	@read $VAR
	./lem-in < resources/error_11
	./lem-in < resources/error_12
	./lem-in < resources/error_13
	./lem-in < resources/error_14
	./lem-in < resources/error_15
	@read $VAR
	./lem-in < resources/error_16
	./lem-in < resources/error_17
	./lem-in < resources/error_18
	./lem-in < resources/error_19
	./lem-in < resources/error_20
	@read $VAR
	./lem-in < resources/error_21
	./lem-in < resources/error_22
	./lem-in < resources/error_23
	./lem-in < resources/error_24
	./lem-in < resources/error_25
	@read $VAR
	./lem-in < resources/error_26
	./lem-in < resources/error_27
endif
map :
	./resources/map_edit $(arg) $(arg_2) resources/$(arg_3)

clean :
	@rm -f $(OBJET)
	@make clean -C libft

fclean : clean
	@rm -f $(NAME)
	@make fclean -C libft

re : fclean all
