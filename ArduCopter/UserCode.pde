/// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-

#ifdef USERHOOK_INIT
void userhook_init()
{
    // put your initialisation code here
    // this will be called once at start-up

    hal.uartC->begin(115200,64,64);
    //hal.uartC->printf("logger initialize\n");
}
#endif

#ifdef USERHOOK_FASTLOOP
void userhook_FastLoop()
{
    // put your 100Hz code here
}
#endif

#ifdef USERHOOK_50HZLOOP
void userhook_50Hz()
{
    // put your 50Hz code here
}
#endif

#ifdef USERHOOK_MEDIUMLOOP
void userhook_MediumLoop()
{
   // put your 10Hz code here

	/*   
	uint32_t gps_time    : g_gps->time_week_ms,
	uint16_t gps_week    : g_gps->time_week,
	int32_t latitude    : current_loc.lat,
	int32_t longitude   : current_loc.lng,
	int32_t altitude    : current_loc.alt,
	int16_t roll        : (int16_t)ahrs.roll_sensor,
	int16_t pitch       : (int16_t)ahrs.pitch_sensor,
	uint16_t yaw         : (uint16_t)ahrs.yaw_sensor
	*/

	hal.uartC->printf("$");

    hal.uartC->printf("%ld ",g_gps->time_week_ms);
    hal.uartC->printf("%d ",g_gps->time_week);

    hal.uartC->printf("%ld ",current_loc.lat);
    hal.uartC->printf("%ld ",current_loc.lng);
    hal.uartC->printf("%ld ",current_loc.alt);

    //print out roll pitch yaw  unit degree*100
    hal.uartC->printf("%d ",(int16_t)ahrs.roll_sensor);
    hal.uartC->printf("%d ",(int16_t)ahrs.pitch_sensor);
    hal.uartC->printf("%u ",(uint16_t)ahrs.yaw_sensor );
        
    hal.uartC->printf("%d ",g.rc_8.radio_out);

    static int last_rc8 = 2000;
    if(g.rc_8.radio_out < 1500 && last_rc8 >=1500){
        hal.uartC->printf("c");
    }
    last_rc8 = g.rc_8.radio_out;

   	hal.uartC->printf("*");
	

}
#endif

#ifdef USERHOOK_SLOWLOOP
void userhook_SlowLoop()
{
    // put your 3.3Hz code here
}
#endif

#ifdef USERHOOK_SUPERSLOWLOOP
void userhook_SuperSlowLoop()
{
    // put your 1Hz code here
}
#endif