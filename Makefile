# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nkouris <nkouris@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/09 09:53:37 by nkouris           #+#    #+#              #
#    Updated: 2018/07/29 21:28:27 by nkouris          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

OUT = testme
LIB = src/libftasm.a
LIBDEBUG = ""
CFLAGS += -Wall -Werror -Wextra
LINK = -L src/ -l ftasm
CC = gcc

################################################################################
# Source directories identifiers                                               #
################################################################################

SRCDIR = src/

OBJSRC = $(patsubst %, %.o, $(addprefix $(SRCDIR), $(SRC)))

################################################################################
# COLOR                                                                        #
################################################################################

RED = \033[1;31m
GREEN = \033[1;32m
YELLOW = \033[1;33m
CYAN = \033[1;36m
RES = \033[0m

################################################################################
# SOURCE FILES                                                                 #
################################################################################

SRC =	\
    ft_bzero \
	ft_cat \
    ft_isalnum \
    ft_isalpha \
    ft_isascii \
    ft_isdigit \
    ft_isprint \
    ft_memcpy \
    ft_memset \
    ft_puts \
    ft_strcat \
    ft_strdup \
    ft_strlen \
    ft_tolower \
    ft_toupper

all: $(LIB) $(OUT)

$(OUT):
	@ echo "$(CYAN)Compiling binary$(RES)"
	$(CC) $(CFLAGS) $(OBJSRC) $(LINK) src/main.c -o $(OUT)
	@ echo "$(GREEN)$(OUT) Made$(RES)"

$(LIB): $(OBJSRC)
	ar -rc $@ $(OBJSRC)

%.o: %.S
	@ echo "$(YELLOW)Compiling $<...$(RES)"
	nasm -f macho64 $< -o $@

clean:
	@ echo "$(RED)Cleaning folders of object files...$(RES)"
	rm -f $(OBJSRC)
	rm -f $(LIB)

fclean: clean
	@ echo "$(RED)Removing program, and library...$(RES)"
	rm -f $(OUT)

re: fclean all
	@ echo "$(GREEN)Program Remade$(RES)"
