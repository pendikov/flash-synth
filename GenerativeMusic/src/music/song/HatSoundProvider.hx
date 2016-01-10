package music.song;
import synth.Instrument;
import synth.ISoundProvider;

/**
 * ...
 * @author Daniil Pendikov
 */
class HatSoundProvider implements ISoundProvider
{

	public function new() 
	{
		
	}
	
	public function numberOfSectionsForInstrument(instrument:Instrument):Int {
		return 100;
	}
	
	public function numberOfTicksInSectionForInstrument(instrument:Instrument, section:Int):Int {
		return 16;
	}
	
	public function soundsInSectionForInstrument(instrument:Instrument, section:Int, tick:Int):Array<PublicSound> {
		if (tick % 2 == 0) 
		{
			return [new PublicSound(90, 1)];
		}
		return null;
	}
	
}