proc import datafile='\\apporto.com\dfs\UNCC\Users\athopte_uncc\Downloads\Assign-1\power_usage.xlsx' 
DBMS=xlsx out = wscust replace; 

proc print data=wscust; 
run;

proc univariate data=wscust normal plot;
var Global_active_power Global_reactive_power Global_intensity;
run;

proc fastclus data=wscust maxclusters=6 out=clust  MAXITER=20;
var Global_active_power Global_reactive_power Global_intensity;
run;

data mod_wscust; set wscust;
if Global_active_power > 5.564 then delete;
if Global_reactive_power > 0.3635 then delete; 
if Global_intensity > 23.3 then delete; 
run;

proc fastclus data=mod_wscust maxclusters=6 out=clust  MAXITER=20;
var Global_active_power Global_reactive_power Global_intensity;
run;

