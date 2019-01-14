/*
 * main.c
 *
 *  Created on: 14Jan.,2019
 *      Author: championsurfer3044
 *
 *  Note: Modified PMOD LED Demo to have a simple state machine
 */


#include "PmodGPIO.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_printf.h"

typedef enum led_pattern_t {
	LED_PATTERN_FWD = 0,
	LED_PATTERN_REV,
	LED_PATTERN_BLINK_ALL,
	LED_PATTERN_MAX
}led_state_t;

PmodGPIO myDevice;
static led_state_t pattern;

static void DemoInitialize();
static void DemoRun();
static void DemoCleanup();
static void EnableCaches();
static void DisableCaches();

static void led_pattern_forward(void);
static void led_pattern_reverse(void);
static void led_pattern_blink_all(void);


int main() {
   DemoInitialize();
   DemoRun();
   DemoCleanup();
   return 0;
}

static void led_pattern_forward(void) {
	u8 count = 1;
	GPIO_setPins(&myDevice, 0x00);
	while (count <= 4) {
		GPIO_setPin(&myDevice, count, 1);
		count++;
		usleep(200000);
    }
	count = 0;
	while (count <= 4) {
		GPIO_setPin(&myDevice, count, 0);
		count++;
		usleep(200000);
    }
}

static void led_pattern_reverse(void) {
	int count = 4;
	GPIO_setPins(&myDevice, 0x00);
	while (count > 0) {
		GPIO_setPin(&myDevice, (u8)count, 1);
		count--;
		usleep(200000);
    }
	count = 4;
	while (count > 0) {
		GPIO_setPin(&myDevice, (u8)count, 0);
		count--;
		usleep(200000);
    }
}

static void led_pattern_blink_all(void) {
	int i;
	GPIO_setPins(&myDevice, 0x00);
	for (i = 0; i < 4; i++) {
		GPIO_setPins(&myDevice, 0x0F);
		usleep(300000);
		GPIO_setPins(&myDevice, 0x00);
		usleep(300000);
	}
}


static void DemoInitialize() {
   EnableCaches();
   GPIO_begin(&myDevice, XPAR_PMODGPIO_0_AXI_LITE_GPIO_BASEADDR, 0x00);
   pattern = LED_PATTERN_BLINK_ALL;
}


static void DemoRun() {
   void (*led_pattern_runner[LED_PATTERN_MAX])(void) = {
		   led_pattern_forward,
		   led_pattern_reverse,
		   led_pattern_blink_all
   };

   xil_printf("GPIO Output Demo\n\r");
   while(1) {
	   led_pattern_runner[pattern++ % LED_PATTERN_MAX]();
   }
}

static void DemoCleanup() {
   DisableCaches();
}

static void EnableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheEnable();
#endif
#endif
}

static void DisableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheDisable();
#endif
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheDisable();
#endif
#endif
}
