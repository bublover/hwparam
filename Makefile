TARGET := hwparam
SRCS := $(wildcard ./src/*.c)
CFLAGS := -I./inc
OBJS := $(patsubst %.c,%.o,$(SRCS))

.PHONY: $(TARGET)
$(TARGET): $(OBJS) wifi_board_config_$(BOARD).ini
	@ (install -m 444 wifi_board_config_$(BOARD).ini wifi_board_config.ini && \
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) && \
	./$@ && \
	install -m 444 wifi_rf.h $(PRJDIR)/$(KERNEL)/drivers/wifi/uwp/wifi_rf_$(BOARD).h && \
	rm -rf wifi_board_config.ini)

.PHONY: clean
clean:
	@ rm -rf $(TARGET) $(OBJS)
