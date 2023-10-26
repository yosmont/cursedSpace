##
## yet another Makefile
## File description:
## not a copy of a exemple Makefile... not at all
##

NAME	=	cursedSpace

SRC	=	submodule/cursedLayer/src/ALayer.cpp	\
		submodule/cursedLayer/src/LayeredScene	\
		src/StarLayer.cpp						\
		src/SpaceshipLayer.cpp					\
		src/main.cpp

CFLAGS	+=	-Wall -Wextra -I"src/" -I"submodule/cursedLayer/src/" -lncurses

DFLAG	+=	-g

OBJ	=	$(SRC:.cpp=.o)

%.o:%.cpp
	@echo -e "\033[0;35m[core] [g++]\033[0m $< \033[0;31m▬▶\033[0m $@"
	@g++ $< -c -o $@ $(CFLAGS)

all:	core
	@echo "┌─┐┌┐┌┌┬┐  ┌─┐┌─┐┌┬┐┌─┐┬┬  ┬┌┐┌┌─┐   ┬ ┬┌─┐┌┬┐┬"
	@echo "├┤ │││ ││  │  │ ││││├─┘││  │││││ ┬   └┬┘├─┤││││"
	@echo "└─┘┘└┘─┴┘  └─┘└─┘┴ ┴┴  ┴┴─┘┴┘└┘└─┘┘   ┴ ┴ ┴┴ ┴o"

core:		$(OBJ)
	@echo -e "\033[0;35m[core] [g++]\033[0m $(OBJ) \033[0;31m▬▶\033[0m $(NAME)"
	@g++ -o $(NAME) $(CFLAGS) $(OBJ)

clean:
	@echo -e "\033[0;35m[core] [rm]\033[0m $(OBJ)"
	@rm -f $(OBJ)
	@echo "┌─┐┌┐┌┌┬┐  ┌─┐┬  ┌─┐┌─┐┌┐┌   ┬ ┬┌─┐┌┬┐┬"
	@echo "├┤ │││ ││  │  │  ├┤ ├─┤│││   └┬┘├─┤││││"
	@echo "└─┘┘└┘─┴┘  └─┘┴─┘└─┘┴ ┴┘└┘┘   ┴ ┴ ┴┴ ┴o"

fclean:		clean
	@echo -e "\033[0;35m[core] [rm]\033[0m $(NAME)"
	@rm -f $(NAME)
	@echo "┌─┐┌┐┌┌┬┐  ┌─┐┌─┐┬  ┌─┐┌─┐┌┐┌   ┬ ┬┌─┐┌┬┐┬"
	@echo "├┤ │││ ││  ├┤ │  │  ├┤ ├─┤│││   └┬┘├─┤││││"
	@echo "└─┘┘└┘─┴┘  └  └─┘┴─┘└─┘┴ ┴┘└┘┘   ┴ ┴ ┴┴ ┴o"

re:		fclean all
	@echo "┌─┐┌┐┌┌┬┐  ┬─┐┌─┐   ┬ ┬┌─┐┌┬┐┬"
	@echo "├┤ │││ ││  ├┬┘├┤    └┬┘├─┤││││"
	@echo "└─┘┘└┘─┴┘  ┴└─└─┘┘   ┴ ┴ ┴┴ ┴o"

.PHONY: 	all clean fclean re core