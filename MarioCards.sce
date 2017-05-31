#Headers
active_buttons=5;
default_background_color= 255,255,255; 
default_text_color=0,0,0; 
default_font="calibri";

#SDL

begin; 

TEMPLATE "Bitmaps.tem";

TEMPLATE "Trials.tem"; 


#PCL
begin_pcl; 

include "ResponseManagement.pcl"

include "MarioPCL.pcl"

include "TotalOutput.pcl"

EndTrial.present(); 