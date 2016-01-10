package synth;

/**
 * ...
 * @author Daniil Pendikov
 */
class SawOscillator extends Oscillator
{

	public function new() 
	{
		super();
	}
	//return x - Math.floor(x + 1/2);
	public override function left(frequency:Float, position:Int):Float
	{
		var phase = frequency * ((phaseShift + leftPhaseShift + position) / rate * period);
		return (phase - Math.floor(phase + 1/2)) * amplitudeLeft;
	}
	
	public override function right(frequency:Float, position:Int):Float
	{
		var phase = frequency * ((phaseShift + rightPhaseShift + position) / rate * period);
		return (phase - Math.floor(phase + 1/2)) * amplitudeRight;
	}
	
}