##
## yet another Makefile
## File description:
## not a copy of a exemple Makefile... not at all
##

NAME	=	cursedSpace

SRC	=	submodule/cursedLayer/src/ALayer.cpp		\
		submodule/cursedLayer/src/LayeredScene.cpp	\
		src/StarLayer.cpp							\
		src/SpaceshipLayer.cpp						\
		src/main.cpp

CFLAGS	+=	-lncurses -Wall -Wextra -I"src/" -I"submodule/cursedLayer/src/"

DFLAG	+=	-g

OBJ	=	$(SRC:.cpp=.o)

%.o:%.cpp
	@echo -e "\033[0;35m[core] [g++]\033[0m $< \033[0;31m▬▶\033[0m $@"
	@g++ $< -c -o $@ $(CFLAGS)

all:	core
	@echo "###########################"
	@echo "### END COMPILING, YAM! ###"
	@echo "###########################"

core:		$(OBJ)
	@echo -e "\033[0;35m[core] [g++]\033[0m $(OBJ) \033[0;31m▬▶\033[0m $(NAME)"
	@g++ -o $(NAME) $(OBJ) $(CFLAGS)

clean:
	@echo -e "\033[0;35m[core] [rm]\033[0m $(OBJ)"
	@rm -f $(OBJ)
	@echo "#######################"
	@echo "### END CLEAN, YAM! ###"
	@echo "#######################"

fclean:		clean
	@echo -e "\033[0;35m[core] [rm]\033[0m $(NAME)"
	@rm -f $(NAME)
	@echo "##########################"
	@echo "#### END FCLEAN, YAM! ####"
	@echo "##########################"

re:		fclean all
	@echo "####################"
	@echo "### END RE, YAM! ###"
	@echo "####################"

.PHONY: 	all clean fclean re core