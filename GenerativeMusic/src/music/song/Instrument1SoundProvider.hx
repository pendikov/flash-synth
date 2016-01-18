package music.song;
import music.Chord;
import music.ChordProgression;
import music.Harmony;
import music.Scale;
import synth.Instrument;
import synth.ISoundProvider;

/**
 * ...
 * @author Daniil Pendikov
 */
class Instrument1SoundProvider implements ISoundProvider
{
	var chords:Array<Array<Float>> = [];
	var currentChord:Int = 0;
	var notes = [261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25];
	public var titles = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B", "C"];
	public var index:Int = 0;

	public function new() 
	{
		this.index = Std.int(Math.random()*13);
		var scale = Scale.major(notes[index]);
		var progression = new ChordProgression().random();
		for (i in 0...progression.length) 
		{
			var chord = scale.chord(progression[i]);
			if (i != 0) 
			{
				this.chords.push(chord.bestInversion(this.chords[i-1]));
			} else {
				this.chords.push(chord.bestInversion());
			}
		}
		
	}
	
	public function numberOfSectionsForInstrument(instrument:Instrument):Int {
		return chords.length*4;
	}
	
	public function numberOfTicksInSectionForInstrument(instrument:Instrument, section:Int):Int {
		return 16;
	}
	
	public function soundsInSectionForInstrument(instrument:Instrument, section:Int, tick:Int):Array<PublicSound> {
		var noteIndex:Int = tick % 4;
		if (noteIndex == 3) 
		{
			noteIndex = 1;
		}
		var chordIndex:Int = section % chords.length;
		var frequency = chords[chordIndex][noteIndex];
		var sound = new PublicSound(frequency, 1);
		return [sound];
	}
	
}