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

#include "MarioPCL.pcl"#

#Response data & output 
response_data Rdata; 
output_file output = new output_file;
string ParticipantNumber = logfile.subject(); 
if ParticipantNumber.count() > 0 then output.open (ParticipantNumber + "_MarioCards.txt"); 
else output.open( "999_MarioCards.txt"); end; 
output.print( "date/time: " + date_time("dd mmmm yyyy' 't")+"\n");
output.print("Trial\tStimuli\tPrincple\tButton\tSorting\tFeedback\tErrortype\n");

#include "Start.pcl"; 

#Show introduction 
#intro.present();

#Sorting: 1=form, 2=color, 3=amount
array <int> sort[6]={1,2,3,1,2,3};

#Main Trial Start
stimuli.shuffle(); 
#sort.shuffle(); 
stimulus_data laststim = stimulus_manager.last_stimulus_data(); 
int c=0; #correct
int f=0; #false 
int tc=0; #total correct
int tf=0; #total incorrect
int p=0; #perseveration
int np=0; #nonperseveration



#Main Trial Loop 
loop int i=1 until i > stimuli.count() begin;

	loop int s=1 until s > sort.count() begin;
		VB.set_part(5, stimuli[i]); 
		MainEvent.set_event_code(stimuli[i].description()); 
		MainTrial.set_duration(forever); 
		MainTrial.set_type( first_response );
		MainTrial.present(); 
		
		output.print(i); 
		output.print("\t"); 
		output.print(stimuli[i].description()); 
		output.print("\t"); 
		
		response_data respdat = response_manager.last_response_data(); 
		int BP = respdat.button(); 		
		output.print(BP);
		output.print("\t"); 
		
		#Matching the cards on the screen
		if BP == 1 then VB.set_part_x(5,-700); VB.set_part_y(5, 0); end; 
		if BP == 2 then VB.set_part_x(5,-250); VB.set_part_y(5, 0); end; 
		if BP == 3 then VB.set_part_x(5,250); VB.set_part_y(5, 0); end; 
		if BP == 4 then VB.set_part_x(5,700); VB.set_part_y(5, 0); end; 		
		MainTrial.set_duration(1000); 
		MainTrial.present(); 
		
		#Putting it back for the next trial 
		VB.set_part_x(5,0); 
		VB.set_part_y(5, -300); 
		
		#Showing Feedback 
		if sort[s]==1 then output.print("charac"); output.print("\t"); 
			if (stimuli[i].description().find("M") == 1 && BP == 1)
			|| (stimuli[i].description().find("S") == 1 && BP == 2)
			||	(stimuli[i].description().find("L") == 1 && BP == 3) 
			|| (stimuli[i].description().find("P") == 1 && BP == 4)
			then 		
				feedbackcorrect.present();
				output.print("correct");
				output.print("\t"); 
				c=c+1;
				f=0;
				tc=tc+1; 
			else 
				feedbackwrong.present();
				output.print("incorrect");
				output.print("\t"); 
				if (stimuli[i].description().find("1") > 0 && BP == 1)
				|| (stimuli[i].description().find("2") > 0 && BP == 2)
				||	(stimuli[i].description().find("3") > 0 && BP == 3) 
				|| (stimuli[i].description().find("4") > 0 && BP == 4)
				then p=p+1; 
				output.print("P");
				output.print("\t"); 
				else np=np+1; 
				output.print("NP");
				output.print("\t");
				end; 
			f=f+1; 
			c=0; 
			tf=tf+1; 
			end; 
		end; 
		
		if sort[s]==2 then 
			output.print("color");
			output.print("\t");  
			if (stimuli[i].description().find("R") == 2 && BP == 1)
			|| (stimuli[i].description().find("G") == 2 && BP == 2)
			||	(stimuli[i].description().find("B") == 2 && BP == 3) 
			|| (stimuli[i].description().find("V") == 2 && BP == 4)
			then 		
				feedbackcorrect.present();
				output.print("correct");
				output.print("\t"); 
				c=c+1;
				f=0; 
				tc=tc+1; 		
			else 
				feedbackwrong.present();
				output.print("incorrect");
				output.print("\t"); 
				if (stimuli[i].description().find("M") == 1 && BP == 1)
				|| (stimuli[i].description().find("S") == 1 && BP == 2)
				||	(stimuli[i].description().find("L") == 1 && BP == 3) 
				|| (stimuli[i].description().find("P") == 1 && BP == 4)
				then p=p+1; 
				output.print("P");
				output.print("\t"); 
				else np=np+1; 
				output.print("NP");
				output.print("\t");
				end; 
			f=f+1; 
			c=0; 
			tf=tf+1; 
			end; 
		end; 
		
		if sort[s]==3 then 
			output.print("amount");
			output.print("\t"); 
			if (stimuli[i].description().find("1") > 0 && BP == 1)
			|| (stimuli[i].description().find("2") > 0 && BP == 2)
			||	(stimuli[i].description().find("3") > 0 && BP == 3) 
			|| (stimuli[i].description().find("4") > 0 && BP == 4)
			then 		
				feedbackcorrect.present();
				output.print("correct");
				output.print("\t"); 
				c=c+1;
				f=0; 
				tc=tc+1; 
			else 
				feedbackwrong.present();
				output.print("incorrect");
				output.print("\t"); 
				if (stimuli[i].description().find("R") == 2 && BP == 1)
				|| (stimuli[i].description().find("G") == 2 && BP == 2)
				||	(stimuli[i].description().find("B") == 2 && BP == 3) 
				|| (stimuli[i].description().find("P") == 2 && BP == 4)
				then p=p+1; 
				output.print("P");
				output.print("\t"); 
				else np=np+1; 
				output.print("NP");
				output.print("\t");
				end; 
			f=f+1; 
			c=0; 
			tf=tf+1; 
			end;  
		end; 
		
	##########################################	
	#Knowing when to continue or when to end #
	##########################################
	if c>5 then s=s+1; c=0; end; #If 6 cards (in a row) were correct, the participant continues to the next sorting principle without letting know
	if f>5 then s=sort.count(); i=stimuli.count(); end; #If participant misses 6 in a row, the task will end. 
	if tc>2 then s=sort.count(); i=stimuli.count(); end; #If all cards are sorted, the task will end. 
	end; 
i=i+1;
end; 

EndTrial.present(); 

output.print("\n\n\Total Correct\tTotalFalse\tTotalP\tTotalNP\n");
output.print(tc); 
output.print("\t"); 
output.print(tf); 
output.print("\t"); 
output.print(p); 
output.print("\t"); 
output.print(np); 
output.print("\t"); 

