TARGET	:= hwparam
SRCS	:= $(wildcard ./src/*.c)
OBJS	:= $(patsubst %.c,%.o,$(SRCS))
BOARD	?= 96b_ivy5661
DEFS	?= BINARY_OUTPUT
CFLAGS	:= -I./inc -D$(DEFS)

.PHONY: $(TARGET)
$(TARGET): $(OBJS) wifi_board_config_$(BOARD).ini
	@ ($(CC) $(CFLAGS) -o $(TARGET) $(OBJS))
	@ (./$@ -f wifi_board_config_$(BOARD).ini)

.PHONY: clean
clean:
	@ rm -rf $(TARGET) $(OBJS)
