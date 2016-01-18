package synth.instruments;
import motion.Actuate;
import synth.filters.LowPass;
import synth.Instrument;

/**
 * ...
 * @author Daniil Pendikov
 */
class Instrument1 extends Instrument
{
	var filter = new LowPass();

	public function new() 
	{
		super();
		oscillators.push(new SineOscillator());
		oscillators.push(new SquareOscillator());
		
		envelope.attackTime = 0.01;
		envelope.decayTime = 0.7;
		envelope.releaseTime = 2;

		envelope.attackMaxValue = 0.6;
		envelope.sustainMaxValue = 0.4;
		
		oscillators[0].amplitude = 0;
		oscillators[1].amplitude = 0.04;
		volume = 1;
		
		
		filters.push(filter);
	}
	
}