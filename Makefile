TARGET := convert_ini
SRCS := $(wildcard ./src/*.c)
INC := -I./inc
OBJS := $(patsubst %.c,%.o,$(SRCS))


all: $(TARGET)

$(TARGET) : $(OBJS)
	cc -o $(TARGET) $(OBJS)

%.o : %.c
	cc $(INC) -o $@ -c $<

.PHONY : clean
clean:
	rm -rf $(TARGET) $(OBJS)
