package music;
import music.Music.BPMPosition;
import synth.Sound;

/**
 * ...
 * @author Daniil Pendikov
 */

class BPMPosition {
	public var bpm:Int = 0;
	public var position:Int = 0;	
	public function new(bpm:Int, position:Int)
	{
		this.bpm = bpm;
		this.position = position;
	}
}

//8 bars
class Section {
	public var bars:Array<Bar8> = [];
}

//8 kicks 8 snares 8 bars
class Bar8 {
	
	public var notes:Array<Note> = [];
	
}

//64
class Note {
	public var frequency:Float = 0;
	public var tick:Float = 0;
	public var duration:Int = 0;
}
 
class Music
{
	public var bpm:Int = 100;
	public var openingLength:Int = 2;
	public var verseLength:Int = 4;
	public var chorusLength:Int = 1;
	public var bridgeLength:Int = 1;
	public var opening:Array<Section> = []; //16 bars
	public var verse:Array<Section> = []; //32 bars
	public var chorus:Array<Section> = []; //8 bars
	public var bridge:Array<Section> = []; //8 bars
	public var keyFrequency:Float = 440;
	public var scale:Array<Float> = [];

	public function new() 
	{
		
		
	}
	
	public function generate()
	{
	
	}
	
}