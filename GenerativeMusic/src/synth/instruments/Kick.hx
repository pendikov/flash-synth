package synth.instruments;
import synth.Instrument;

/**
 * ...
 * @author Daniil Pendikov
 */
class Kick extends Instrument
{

	public function new() 
	{
		super();		
		oscillators.push(new SineOscillator());
		
		envelope.attackTime = 0.001;
		envelope.decayTime = 0.3;
		envelope.releaseTime = 0.01;
		envelope.attackMaxValue = 0.9;
		envelope.sustainMaxValue = 0.001;
		
		oscillators[0].amplitude = 0.5;
	}
	
}