# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acottier <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/01 13:55:41 by acottier          #+#    #+#              #
#    Updated: 2016/06/21 18:03:09 by acottier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RED				=	\033[0;31m
GREEN			=	\033[0;32m
YELLOW			=	\033[0;33m
NC				=	\033[0m

NAME			= 	ft_ls
LIBNAME			=	libft

SRC_PATH		= 	sources
OBJ_PATH		= 	objects

SRC_NAMES		= 	main.c \
					treat_opts.c \
					check_opts.c \
					format_opts.c \
					mklist.c \
					treat_args.c \
					global_treat.c \
					simple_output.c \
					file_walkthrough.c \
					dir_walkthrough.c \
					sort_ent_list.c \
					recursive.c \
					show_dir_content.c \
					utilities.c \
					utilities2.c \
					utilities3.c \
					non_recursive.c \
					sort_display.c \
					print_result_list.c \
					long_display.c \
					format_long_output.c \
					color_display.c \
					error.c

OBJ_NAMES 		= 	$(SRC_NAMES:.c=.o)

SRC 			= 	$(addprefix $(SRC_PATH)/,$(SRC_NAMES))
OBJ				= 	$(addprefix $(OBJ_PATH)/,$(OBJ_NAMES))

FLAGS 			= 	-Wall -Wextra -Werror
IFLAGS			=	-Iincludes
LDFLAGS			=	-Llibft
LDLIBS			=	-lft

all :
	@time (make $(NAME)) 2> time.txt
	@printf "${GREEN}Ls project compilation finished, executable ft_ls ready : ${NC}"
	@printf "${YELLOW}"
	@cat time.txt | head -2 | tail -1
	@printf "${NC}"
	@rm time.txt

$(NAME) : $(OBJ)
	@make chrono -C $(LIBNAME) && make clean -C $(LIBNAME)
	@gcc $(FLAGS) $(LDFLAGS) $(LDLIBS) $^ -o $@

$(OBJ_PATH)/%.o : $(SRC_PATH)/%.c
	@mkdir -p $(OBJ_PATH) && gcc $(FLAGS) $(IFLAGS) -o $@ -c $<

clean : 
	@rm -rf $(OBJ_PATH)
	@printf "${RED}Ls' object files deleted.${NC}\n"

fclean : clean
	@rm -f $(NAME)
	@printf "${RED}Executable ft_ls deleted.${NC}\n"

re : fclean all

nolib : fclean
	@(time gcc $(FLAGS) $(IFLAGS) -c $(SRC) && mkdir -p $(OBJ_PATH) && mv $(OBJ_NAMES) $(OBJ_PATH) && gcc $(FLAGS) $(LDFLAGS) $(LDLIBS) $(OBJ) -o $(NAME)) 2> time.txt
	@printf "${GREEN}Ls project compilation finished, executable ft_ls ready : ${NC}"
	@printf "${YELLOW}"
	@cat time.txt | head -2 | tail -1
	@printf "${NC}"
	@rm time.txt

noerror : fclean
	gcc $(FLAGS) $(IFLAGS) -c $(SRC)
	mkdir -p $(OBJ_PATH)
	mv $(OBJ_NAMES) $(OBJ_PATH)
	gcc $(FLAGS) $(LDFLAGS) $(LDLIBS) $(OBJ) -o $(NAME)

