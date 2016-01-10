package synth;
import synth.Instrument.PublicSound;

/**
 * ...
 * @author Daniil Pendikov
 */
interface ISoundProvider
{

	public function numberOfSectionsForInstrument(instrument:Instrument):Int;
	
	public function numberOfTicksInSectionForInstrument(instrument:Instrument, section:Int):Int;
	
	public function soundsInSectionForInstrument(instrument:Instrument, section:Int, tick:Int):Array<PublicSound>;
	
}