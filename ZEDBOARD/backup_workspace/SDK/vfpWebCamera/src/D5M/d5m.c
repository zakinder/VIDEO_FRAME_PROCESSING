// LAST TESTED : 11/29/2019

#include "I2C_D5M/i2c_d5m.h"
#include "VIDEO_CHANNEL/channel.h"
#include "VIDEO_FILTERS/filters.h"

//Set and write all filters kernal coefficients and system default configurable registers
void d5m()
{
	//Write d5m camera config values on i2c bus
	camera_hdmi_config();
	//Set All Filters Kernal Coefficients
    KernelInit();
	//Set vdma and hdmi default configurable registers
    vdmaHdmiConfig();
	//Set RgbLevel Registers
    vfpRgbLevelConfig();
	//Set System Default Configurable Registers
	d5mInit();
	//Write System Configurable Registers to Slave devices
	WriteToVfp();
    //Initialize Vdma to hdmi
	InitVdmaHdmi();


}
