#AUTHORS
#Manik Arora (2015053)
#Raunak Sinha (2015075)

COMMAND1 = avr
FLAVOR1 = gcc
FLAVOR2 = objcopy
MCU = atmega328p
FILENAME = bled
DEVICE_USED = arduino
PORT_USED = /dev/ttyUSB0
UP2ARDUINO = avrdude
REMOVE = rm -rf


default: program clean

compile: $(FILENAME).hex

$(FILENAME).hex: $(FILENAME)
	$(COMMAND1)-$(FLAVOR2) $(FILENAME) -O ihex -R .eeprom $(FILENAME).hex

$(FILENAME): $(FILENAME).o
	$(COMMAND1)-$(FLAVOR1) -mmcu=$(MCU) $(FILENAME).o -o $(FILENAME)

$(FILENAME).o: $(FILENAME).c
	$(COMMAND1)-$(FLAVOR1) $(FILENAME).c -Os -mmcu=$(MCU) -c -o $(FILENAME).o

program: $(FILENAME).hex
	$(UP2ARDUINO) -F -V -c $(DEVICE_USED) -p $(MCU) -P $(PORT_USED) -b 57600 -U flash:w:$(FILENAME).hex

clean:
	$(REMOVE) $(FILENAME).o $(FILENAME).hex $(FILENAME)