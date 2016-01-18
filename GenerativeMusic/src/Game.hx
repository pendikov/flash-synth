package ;

#if flash
import flash.net.FileReference;
import music.ChordProgression;
import music.CircleOfFifth;
import music.Scale;
import music.song.HatSoundProvider;
import music.song.Instrument1SoundProvider;
import music.song.KickSoundProvider;
import music.song.SnareSoundProvider;
import synth.Instrument;
import synth.instruments.Hat;
import synth.instruments.Instrument1;
import synth.instruments.Kick;
import synth.instruments.Snare;
import synth.SquareOscillator;
#end

import music.Program;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import ui.KeyboardControls;
import ui.KeyboardValueControl;

/**
 * ...
 * @author Daniil Pendikov
 */
class Game extends Sprite
{
	var synth = new synth.Synth();
	var soundProvier:Instrument1SoundProvider;

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		new CircleOfFifth(261.63);
		
		var kick = new Kick();
		var snare = new Snare();
		var hat = new Hat();
		var instrument1 = new Instrument1();
		
		//kick.soundProvider = new KickSoundProvider();
		//snare.soundProvider = new SnareSoundProvider();
		//hat.soundProvider = new HatSoundProvider();
		soundProvier = new Instrument1SoundProvider();
		instrument1.soundProvider = soundProvier;
		
		
		synth.instruments = [kick, snare, hat, instrument1];
	}
	
	function onAddedToStage(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	function onKeyDown(e:KeyboardEvent)
	{		
		trace(e.keyCode);
		if (e.keyCode == 27) 
		{
			saveFile();
		}
		var keys:Array<UInt> = [49,50,51,52,53,54,55,56,57,48,189,187];
		
		for (key in keys) 
		{
			if (e.keyCode == key) 
			{
				trace(keys.indexOf(key)+1);
			}
		}
	}
	
	function saveFile() {
		var data = synth.data;
		var encoder = new utils.WavEncoder();
		var encoded = encoder.encode(data, 2);
		#if flash
		var title = "prelude in " + soundProvier.titles[soundProvier.index];
		new FileReference().save(encoded, title+".wav");
		#end
	}
		
	function onKeyUp(e:KeyboardEvent)
	{
		
	}
	
}