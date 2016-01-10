package synth;
import openfl.events.SampleDataEvent;
import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.utils.ByteArray;

/**
 * ...
 * @author Daniil Pendikov
 */
class Synth
{
	var channel:SoundChannel;
	var sound:Sound;
	public var instruments:Array<Instrument> = [];
	var rate:Int = 44100;
	var sampleRate:Int = 6000;
	public var data:ByteArray = new ByteArray();
	var _bpm:Int = 100;
	public var bpm(get, set):Int;
	public function get_bpm() { return _bpm; }
	public function set_bpm(v:Int)
	{
		_bpm = v;
		for (i in instruments) 
		{
			i.bpm = _bpm;
		}
		return v;
	}
	
	public function new() 
	{
		sound = new Sound();
		sound.addEventListener(SampleDataEvent.SAMPLE_DATA, onSampleData);
		channel = sound.play();
	}
	
	function onSampleData(e:SampleDataEvent) {
		
		var position:Int = Std.int(e.position);
		
		var left = new Array<Float>();
		var right = new Array<Float>();
		
		for (i in 0...sampleRate) 
		{
			left[i] = 0;
			right[i] = 0;
		}
		
		for (instrument in instruments) 
		{
			instrument.stereo(left, right, position, sampleRate);
		}
		for (i in 0...sampleRate) 
		{
			var l = left[i];
			var r = right[i];				
			e.data.writeFloat(l);
			e.data.writeFloat(r);
			data.writeFloat(l);
			data.writeFloat(r);
		}
	}
	
}