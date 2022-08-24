NAME		=	corrector

CXX			=	c++
CXXFLAGS	=	-Wall -Wextra -Werror
INCLUDES	=	-I.
RM			=	rm -f

SRCS		=	corrector.cpp		\

SRCS2		=	replacer.cpp		\

OBJS		=	$(SRCS:.cpp=.o)
OBJS2		=	$(SRCS2:.cpp=.o)

$(NAME)		:	$(OBJS) $(OBJS2)
				$(CXX) $(CXXFLAGS) -o corrector $(OBJS)
				$(CXX) $(CXXFLAGS) -o vpdlwldkfrhflwma $(OBJS2)

all			:	$(NAME)

%.o			:	%.cpp
				$(CXX) $(CXXFLAGS) -o $@ -c $< $(INCLUDES)

clean		:
				$(RM) $(OBJS) $(OBJS2)

fclean		:	clean
				$(RM) $(NAME) vpdlwldkfrhflwma

re			:
				$(MAKE) fclean
				$(MAKE) all

.PHONY		: all clean fclean re