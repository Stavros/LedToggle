/* Engineer:	Stavros Kalapothas
   Create Date:	24/01/2019
   Project Name: LedToggle (ask5.1)
*/

#include <system.h>
#include <altera_avalon_pio_regs.h>
#include <alt_types.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/alt_irq.h>
#include <io.h>

void delay(void);
alt_u8 SW_value;

static void handle_sw_interrupts(void)
{
 SW_value = IORD_ALTERA_AVALON_PIO_DATA(SW_PIO_BASE);
 IOWR_ALTERA_AVALON_PIO_EDGE_CAP(SW_PIO_BASE,0x00);
}

//SW_PIO
void init_SW(void)
{
 SW_value = 0xff;
 IOWR_ALTERA_AVALON_PIO_IRQ_MASK(SW_PIO_BASE,0xff);  //PIO
 IOWR_ALTERA_AVALON_PIO_EDGE_CAP(SW_PIO_BASE,0x00);  //EDGE_REGISTER
 alt_irq_register(SW_PIO_IRQ,SW_PIO_BASE,handle_sw_interrupts);
}

void delay(void)
{
 alt_u32 i=0;
 while(i<1000000)
  i++;
}

int main()
{
  init_SW();
  while(1)
  {
   if((SW_value) == 0x00)
   {
    printf("LED OFF!\n");
    IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE,0x00); // set led pin low
    usleep(500);
    //delay();
   }
   else if((SW_value) == 0x01)
   {
	delay(); // add delay
    printf("LED ON!\n");
    IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE,0x01); // set led pin high
    usleep(500);
   }
  }
  return 0;
}
