package synth;

/**
 * ...
 * @author Daniil Pendikov
 */
class TriangleOscillator extends Oscillator
{

	public function new() 
	{
		super();
	}
	
	public override function left(frequency:Float, position:Int):Float
	{
		var phase = frequency * ((phaseShift + leftPhaseShift + position) / rate * period);
		var saw = (phase - Math.floor(phase + 1/2));
		return Math.abs(saw) * amplitudeLeft;
	}
	
	public override function right(frequency:Float, position:Int):Float
	{
		var phase = frequency * ((phaseShift + rightPhaseShift + position) / rate * period);
		var saw = (phase - Math.floor(phase + 1/2));
		return Math.abs(saw) * amplitudeRight;
	}
	
}