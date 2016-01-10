package synth;
import synth.filters.IFilter;
import synth.Instrument.PrivateSound;

/**
 * ...
 * @author Daniil Pendikov
 */
class PublicSound {
	public var frequency:Float;
	public var duration:Float;
	public function new(f:Float, d:Float)
	{
		this.frequency = f;
		this.duration = d;
	}
}

class PrivateSound {
	public var frequency:Float;
	public var position:Int;
	public var duration:Int;
	public function new(f:Float, p:Int, d:Int)
	{
		this.frequency = f;
		this.position = p;
		this.duration = d;
	}
}
 
class Instrument
{
	public var name:String = "";
	public var tag:Int = 0;
	public var oscillators:Array<Oscillator> = [];	
	public var envelope:Envelope = new Envelope();
	
	public var filters:Array<IFilter> = [];
	
	var _soundProvider:ISoundProvider;
	public var soundProvider(get, set):ISoundProvider;
	public function get_soundProvider() { return _soundProvider; }
	public function set_soundProvider(v:ISoundProvider)
	{
		_soundProvider = v;
		setupSoundProvider();
		return _soundProvider;
	}	
	var numberOfSections:Int = 0;
	var currentSection:Int = 0;
	var currentTick:Int = -1;
	var sounds:Array<PrivateSound> = [];
	
	var _bpm:Int = 130;
	public var bpm(get, set):Int;
	public function get_bpm() { return _bpm; }
	public function set_bpm(v:Int)
	{
		_bpm = v;
		return v;
	}
	public var samplesPerTick:Int = 0;
	public var volume:Float = 1;
	
	public function setupSoundProvider()
	{
		if (_soundProvider == null) { return; };
		samplesPerTick = Std.int(44100 / (_bpm / 60) / 4);
	}
	
	function tick(position:Int) {
		
		if (_soundProvider == null) return;
		
		if (currentTick < _soundProvider.numberOfTicksInSectionForInstrument(this, currentSection)-1) {
			currentTick++;
		} else {
			if (currentSection < _soundProvider.numberOfSectionsForInstrument(this)-1) {
				currentSection++;
				currentTick = 0;
			} else {
				finish();
				return;
			}
		}
		var publicSounds = _soundProvider.soundsInSectionForInstrument(this, currentSection, currentTick);
		if (publicSounds != null && publicSounds.length > 0) {
			for (publicSound in publicSounds) {
				var privateSound = new PrivateSound(publicSound.frequency, position, Std.int(publicSound.duration * samplesPerTick));
				sounds.push(privateSound);
			}			
		}
	}
	
	function finish() {
		
	}

	public function new()
	{
		
	}
	
	public function stereo(left:Array<Float>, right:Array<Float>, position:Int, numSamples:Int)
	{
		for (i in 0...numSamples) 
		{
			if (position % samplesPerTick == 0) 
			{
				tick(position);
			}
			var l:Float = 0;
			var r:Float = 0;
			
			var j = sounds.length-1;
			while (j >= 0) {
				var s = sounds[j];
				if (position > s.position && s.position+s.duration+envelope.releaseTime*envelope.samplesPerTick > position) {
					for (o in oscillators) {
						var p = position - s.position;
						var wl = o.left(s.frequency, p);
						var wr = o.right(s.frequency, p);
						l += envelope.left(wl, p, s.position, s.duration);
						r += envelope.right(wl, p, s.position, s.duration);
					}
				} else if (s.position+s.duration < position) {
					sounds.remove(s);
				}
				j--;
			}
			for (f in filters) 
			{
				l = f.process(l);
				r = f.process(r);
			}
			left[i] += l*volume;
			right[i] += r*volume;
			position++;
		}
	}
	
}