package synth.instruments;
import synth.Instrument;

/**
 * ...
 * @author Daniil Pendikov
 */
class Hat extends Instrument
{

	public function new() 
	{
		super();
		oscillators.push(new NoiseOscillator());
		
		envelope.attackTime = 0;
		envelope.decayTime = 0.1;
		envelope.releaseTime = 0;

		envelope.attackMaxValue = 0.30;
		envelope.sustainMaxValue = 0.00;
		
		oscillators[0].amplitude = 0.08;
	}
	
}