package music;
import synth.Instrument;
import synth.instruments.Hat;
import synth.instruments.Kick;
import synth.instruments.Snare;
import synth.Sound;

/**
 * ...
 * @author Daniil Pendikov
 */
class Program
{

	public function new() 
	{
		
	}
	
	public function play(instrument:Instrument)
	{
	}
	
	public function beat(synth:synth.Synth)
	{
		//var kick = synth.instruments[0];
		//var hat = synth.instruments[1];
		//var snare = synth.instruments[2];
		//var i1 = synth.instruments[3];
		//
		//var bpm:Int = 115;
		//var duration = Std.int(44100 / (bpm / 60) / 4);
		//var startPosition = 44100;
		//
		//for (i in 0...100) 
		//{
			//if (i % 8 == 0 || (i-2)%16 == 0) {
				//var sound = new Sound(40, startPosition + i * duration, duration);
				//kick.addSound(sound);
			//} else if ((i-4)%8 == 0) {
				//var sound = new Sound(140, startPosition + i * duration, duration);
				//snare.addSound(sound);
			//} 
			//
			//if (i % 2 == 0) {
				//var sound = new Sound(440, startPosition + i * duration, duration);
				//hat.addSound(sound);
			//}
			//if (i != 0 && i % 16 == 0) 
			//{
				//var sound = new Sound(440 * Math.pow(2, -7/12), startPosition + i * duration, duration);
				//i1.addSound(sound);
			//} else
			//if (i % 2 == 0) 
			//{
				//var s1 = new Sound(110, startPosition + i * duration, duration*2);
				//i1.addSound(s1);
			//}
		//}
		//kick.setupSections();
		//snare.setupSections();
		//hat.setupSections();
		//i1.setupSections();
	}
	
}