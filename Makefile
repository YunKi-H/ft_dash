NAME		=	corrector

CXX			=	c++
# CXXFLAGS	=	-Wall -Wextra -Werror
INCLUDES	=	-I.
RM			=	rm -f

SRCS		=	corrector.cpp		\

SRCS2		=	replacer.cpp		\

OBJS		=	$(SRCS:.cpp=.o)
OBJS2		=	$(SRCS2:.cpp=.o)

$(NAME)		:	$(OBJS) $(OBJS2)
				$(CXX) -o corrector $(OBJS)
				$(CXX) -o page_replace $(OBJS2)

all			:	$(NAME)

%.o			:	%.cpp
				$(CXX) -o $@ -c $< $(INCLUDES)

clean		:
				$(RM) $(OBJS) $(OBJS2)

fclean		:	clean
				$(RM) $(NAME) page_replace

re			:
				$(MAKE) fclean
				$(MAKE) all

.PHONY		: all clean fclean re
