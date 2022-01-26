// LAST TESTED : 11/29/2019

#include <xil_types.h>

#include "D5M/d5m.h"
#include "D5M/MENU_CALLS/menu_calls.h"
#include "WEB/web.h"

int main(void)
{
	//Set and write all filters kernal coefficients and system default configurable registers
	d5m();
	//For Debug set menu call to be true else init web server
	menu_calls(TRUE);
	//Run web server
    web();
    return 0;
}
