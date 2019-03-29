TARGET := hwparam
SRCS := $(wildcard ./src/*.c)
INC := -I./inc
OBJS := $(patsubst %.c,%.o,$(SRCS))


all: $(TARGET)

$(TARGET) : $(OBJS)
	@ (install -m 444 wifi_board_config_$(BOARD).ini wifi_board_config.ini && \
	cc -o $(TARGET) $(OBJS) && \
	./$@ && \
	install -m 444 wifi_rf.h $(PRJDIR)/$(KERNEL)/drivers/wifi/uwp/wifi_rf.h)
	rm -rf $@

%.o : %.c
	cc $(INC) -o $@ -c $<

.PHONY : clean
clean:
	rm -rf $(TARGET) $(OBJS)
