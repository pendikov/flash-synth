package music.song;
import music.Harmony;
import synth.Instrument;
import synth.ISoundProvider;

/**
 * ...
 * @author Daniil Pendikov
 */
class Instrument1SoundProvider implements ISoundProvider
{
	var chords:Array<Array<Float>> = [];

	public function new() 
	{
		
		var harmony = new Harmony();
	}
	
	public function numberOfSectionsForInstrument(instrument:Instrument):Int {
		return 0;
	}
	
	public function numberOfTicksInSectionForInstrument(instrument:Instrument, section:Int):Int {
		return 16;
	}
	
	public function soundsInSectionForInstrument(instrument:Instrument, section:Int, tick:Int):Array<PublicSound> {
		
		return null;
	}
	
}