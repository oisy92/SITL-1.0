SIM_Title = {'RCF01', 'RCF02', 'RCF03', 'RCF04', 'BATF01', 'BATF02', 'GPSF01', 'GPSF02', 'GPSF03', 'GPSF04', 'GPSF05', 'SATF01', 'BARF01', 'BARF02', 'BARF03', 'BARF04', 'BARF05', 'GYRF01', 'ACCF01', 'ACCF02', 'ACCF03', 'MAGF01', 'MAGF02', 'RCF05', 'RCF06', 'RCF07', 'RCF08', 'BATF03', 'BATF04', 'GPSF06', 'GPSF07', 'GPSF08', 'GPSF09', 'GPSF10', 'SATF02', 'BARF06', 'BARF07', 'BARF08', 'BARF09', 'BARF10', 'GYRF02', 'ACCF04', 'ACCF05', 'ACCF06', 'MAGF03', 'MAGF04'};
SIM_Param_Initial = {'FS_THR_ENABLE','FS_THR_ENABLE','FS_THR_ENABLE','FS_THR_ENABLE','FS_BAT_ENABLE','FS_BAT_ENABLE','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','FS_THR_ENABLE','FS_THR_ENABLE','FS_THR_ENABLE','FS_THR_ENABLE','FS_BAT_ENABLE','FS_BAT_ENABLE','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION','EKF_ACTION'};
SIM_Param_Final = {'SIM_RC_FAIL','SIM_RC_FAIL','SIM_RC_FAIL','SIM_RC_FAIL','SIM_BATT_VOLTAGE','SIM_BATT_VOLTAGE','SIM_GPS_DISABLED','SIM_GPS_DISABLED','SIM_GPS_DISABLED','SIM_GPS_DELAY','SIM_GPS_BYTELOSS','SIM_GPS_NUMSATS','SIM_BARO_RND','SIM_BARO_DRIFT','SIM_BARO_GLITCH','SIM_BARO_DISABLE','SIM_BARO_DELAY','SIM_GYR_RND','SIM_ACC_RND','SIM_ACCEL_FAIL','SIM_ACC2_RND','SIM_MAG_RND','SIM_MAG_ERROR','SIM_RC_FAIL','SIM_RC_FAIL','SIM_RC_FAIL','SIM_RC_FAIL','SIM_BATT_VOLTAGE','SIM_BATT_VOLTAGE','SIM_GPS_DISABLED','SIM_GPS_DISABLED','SIM_GPS_DISABLED','SIM_GPS_DELAY','SIM_GPS_BYTELOSS','SIM_GPS_NUMSATS','SIM_BARO_RND','SIM_BARO_DRIFT','SIM_BARO_GLITCH','SIM_BARO_DISABLE','SIM_BARO_DELAY','SIM_GYR_RND','SIM_ACC_RND','SIM_ACCEL_FAIL','SIM_ACC2_RND','SIM_MAG_RND','SIM_MAG_ERROR'};
SIM_Param_Initial_Value = [2,0,1,3,1,0,1,2,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,1,3,1,0,1,2,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
SIM_Param_Final_Value = [1,1,1,1,10,10,1,1,1,100,90,1,100,10,100,1,1000,10,100,1,100,100,100,1,1,1,1,10,10,1,1,1,100,90,1,100,10,100,1,1000,10,100,1,100,100,100];
SIM_Speed = [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9];
SIM_Num = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10];
Geofence = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];

Expect_Gen(SIM_Title,SIM_Param_Initial, SIM_Param_Final, SIM_Param_Initial_Value, SIM_Param_Final_Value, SIM_Speed, SIM_Num, Geofence);







