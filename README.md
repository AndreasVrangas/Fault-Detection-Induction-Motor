# Fault-Detection-Induction-Motor

The newMCSA.m file contains the code I used to perform FFT analysis on csv data, obtained on laboratory. The code takes a xlsx file of time stamp data as input and plots the FFT analysis (in dB). It also, anotates the appropriate harmonics to be monitored in case of rotor broken bars. The tind_pcov_speed.m file contains a modified version of a code found on Chapman-"Electrical Machines Fundamentals". The code takes motor's parameters as inputs and plots the induced torque and the converted power in the same graph. 

The xlsx files, are the measurements taken from the lab. Each file name, is a description of the motor's speed(i.e. 1235rpm,1380rpm etc)  and the health condition(1brb = 1 broken bar, 2brb= 2 broken bars, hlthy= healthy etc)
