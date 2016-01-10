package synth;

/**
 * ...
 * @author Daniil Pendikov
 */
class Sound
{
	public var frequency:Float = 0;
	public var position:Int = 0;
	public var duration:Int = 0;

	public function new(frequency:Float = 0, position:Int = 0, duration:Int = 0) 
	{
		this.frequency = frequency;
		this.position = position;
		this.duration = duration;
	}
	
}