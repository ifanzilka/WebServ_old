# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ifanzilka <ifanzilka@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/13 20:44:46 by bmarilli          #+#    #+#              #
#    Updated: 2022/04/23 18:03:03 by jberegon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =		webserv

CXX =		clang++ -g

INC_DIR =	includes #$(shell find includes -type d)

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
SRCS_PARSER_CONFIG = srcs/parse_config/LocationData.cpp srcs/parse_config/ParserConfig.cpp srcs/parse_config/ServerData.cpp
SRCS_MESSENGER = $(SRCS_PARSER_CONFIG) $(SRCS_KQUEUE) $(SRCS_SELECT)  $(SRCS_POLL) $(SRCS) \
	srcs/Messenger.cpp srcs/server/ServerCore.cpp \
	srcs/http/request/Request.cpp \
	srcs/http/request/read_first_block.cpp \
	srcs/http/request/read_body.cpp \
	srcs/server_utils.cpp \
	srcs/http/response/Response.cpp \
	srcs/http/response/collect_response_data.cpp \
	srcs/http/response/CGI.cpp

FLAGS = -D KQUEUE

all:			$(NAME)
	$(CXX) -I$(INC_DIR) $(FLAGS) $(SRCS_MESSENGER) main5.cpp -o $(NAME)

select:
	$(CXX) -I$(INC_DIR) $(SRCS) $(SRCS_SELECT) main2.cpp -o $(NAME)

poll:
	$(CXX) -I$(INC_DIR) $(SRCS) $(SRCS_POLL) main3.cpp	-o $(NAME)

kqueue:
	$(CXX) -I$(INC_DIR) $(SRCS) $(SRCS_KQUEUE) main4.cpp	-o $(NAME)

parse:
	$(CXX) -I$(INC_DIR) $(SRCS_PARSER_CONFIG) main5.cpp

messenger:
	$(CXX) -I$(INC_DIR) $(FLAGS) $(SRCS_MESSENGER) main5.cpp -o $(NAME)

test:
	$(CXX) -I$(INC_DIR) $(SRCS) $(SRCS_SELECT)  srcs/server/ServerCore.cpp main5.cpp

youpi:
	mkdir YoupiBanane
	touch YoupiBanane/youpi.bad_extension
	touch YoupiBanane/youpi.bla
	mkdir YoupiBanane/nop
	touch YoupiBanane/nop/youpi.bad_extension
	touch YoupiBanane/nop/other.pouic
	mkdir YoupiBanane/Yeah
	touch YoupiBanane/Yeah/not_happy.bad_extension

$(NAME): 		$(INC_DIR) $(OBJ)
