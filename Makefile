# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ifanzilka <ifanzilka@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/13 20:44:46 by bmarilli          #+#    #+#              #
#    Updated: 2022/04/18 01:48:25 by ifanzilka        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME =		webserv

CXX =		clang++

INC_DIR =	$(shell find includes -type d)


#Compilation flag
CPPFLAGS = -Wall -Wextra -Werror -std=c++98

OBJ_DIR =	objs
OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:%.cpp=%.o))

# Colors

_GREY=	$'\033[30m
_RED=	$'\033[31m
_GREEN=	$'\033[32m
_YELLOW=$'\033[33m
_BLUE=	$'\033[34m
_PURPLE=$'\033[35m
_CYAN=	$'\033[36m
_WHITE=	$'\033[37m

SRCS		= srcs/server/ServerApi.cpp
SRCS_SELECT = srcs/server/ServerSelect.cpp
SRCS_POLL 	= srcs/server/ServerPoll.cpp
SRCS_KQUEUE = srcs/server/ServerKqueue.cpp


all:			$(NAME)
	

select:
	$(CXX) -I$(INC_DIR) $(SRCS) $(SRCS_SELECT) main2.cpp -o $(NAME)

poll:
	$(CXX) -I$(INC_DIR) $(SRCS) $(SRCS_POLL) main3.cpp	-o $(NAME)

kqueue:
	$(CXX) -I$(INC_DIR) $(SRCS) $(SRCS_KQUEUE) main4.cpp	-o $(NAME)


$(NAME): 		$(INC_DIR) $(OBJ)