%% drive cycles
nedc.data=xlsread("nedc.xlsx");
nedc.time=1:1180;
%plot(nedc.time,nedc.data);




%%vehicle parameters
rw=0.32; %metre teker yarıçapı
m=1500; %kg
me=1.02*m; %dönme atalet momenti
f=0.01; %yuvarlanma direnci katsayısı
cd=0.28; %hava sürtünme katsayısı
A=2.27; %m^2 aracın hava ile karşılaşan bölgesinin yüzey alanı
transmission=7.524; % vites oranı

%%Ambient Parameters
ro_air=1.2;
g=9.81; %yerçekimi

%%eff_map
eff_map.data=xlsread('eff_map.xlsx');
%farklı tork ve devir değerlerinde motorun elektrik enerjisini mekanik
%enerjiye ne kadar verimle dönüştürdüğünün tablosu

eff_map.torque=eff_map.data(2:17,1);%1. sütünun 2.satırından 17. satırına kadar
%olan datalar eff_map.torque a eşit.
eff_map.speed=eff_map.data(1,2:17);
eff_map.efficiency=eff_map.data(2:17,2:17);

%%batt paramters
v_ocv=350; %volt
bat_capacity=36*36*(10^5); %Ws
bat_eff=0.92;
r_int=0.1; %ohm
p_aksesuar=4000;%w



%%run
drive_time=1180;
sim('electric_vehicle');