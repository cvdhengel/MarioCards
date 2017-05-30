#SDL#
active_buttons=5; 

begin; 

box {height = 300; width = 600; color = 0, 0, 0;} ResponseBox;
text{caption=" ";font_size=100;} ResponseText;	
text{caption="Please enter your name";font_size=40;}NameText; 
text{caption="Please enter your age";font_size=40;}YearText; 
text{caption="Continue by pressing the Enter button";font_size=20;}Enter; 

picture {
	box ResponseBox; x = 0; y = 0;
	text ResponseText; x = 0; y = 0;
	text NameText; x = 0; y = 250; 
	text Enter; x=0; y=-200; 
} StartPicture;


trial {
	trial_type = fixed;
	stimulus_event {		
		picture StartPicture;
	}StartEvent;
}StartTrial;


#PCL#
begin_pcl; 



StartTrial.present(); 

	string Name = system_keyboard.get_input(StartPicture,ResponseText);

	out.print(Name);out.print("\n");

StartPicture.set_part(3, YearText); 

StartTrial.present(); 

	string Age = system_keyboard.get_input(StartPicture,ResponseText);

	out.print(Age);out.print("\n");
