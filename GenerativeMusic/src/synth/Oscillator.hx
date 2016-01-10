package synth;

/**
 * ...
 * @author Daniil Pendikov
 */
class Oscillator 
{
	public var rate:Int = 44100;
	public var amplitudeLeft:Float = 1;
	public var amplitudeRight:Float = 1;
	public var period:Float = 2 * Math.PI;
	public var phaseShift:Float = 0;
	public var leftPhaseShift:Float = 0;
	public var rightPhaseShift:Float = 0;
	
	public var amplitude(get, set):Float;
	public function get_amplitude()
	{
		return amplitudeLeft;
	}
	public function set_amplitude(v:Float)
	{
		amplitudeLeft = v;
		amplitudeRight = v;
		return v;
	}

	public function new() 
	{
		
	}
	
	public function left(frequency:Float, position:Int):Float
	{
		return 0;
	}
	
	public function right(frequency:Float, position:Int):Float
	{
		return 0;
	}
	
	
}