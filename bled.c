/* AUTHORS
* Manik Arora (2015053)
* Raunak Sinha (2015075)
*/

#define F_CPU 16000000L

#include <avr/io.h>
#include <util/delay.h>


int main(){

	DDRB |= 0b00100000;
	PORTB |= 0b00100000;

	while(1){
		PORTB |= 0b00100000;
		_delay_ms(1000);
		PORTB &= 0b11011111;
		_delay_ms(1000);
	}
	return 0;
}