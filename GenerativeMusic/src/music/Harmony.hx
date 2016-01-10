package music;

/**
 * ...
 * @author Daniil Pendikov
 */
class HarmonySection {
	
}
 
class Harmony
{
	var scale:Scale;
	var chords:Array<Chord> = [];
	var chordNumbers:Array<Int> = [];
	var numSections:Int;
	var numChordsInSection:Int;
	var currentSection:Int = 0;
	var currentChord:Int = -1;

	public function new(numSections:Int = 10, numChordsInSection:Int = 4) 
	{
		this.numSections = numSections;
		this.numChordsInSection = numChordsInSection;
		scale = Scale.major(263.61);
		
	}
	
	public function next(numNotes:Int = 3):Array<Float>
	{
		if (currentChord < numChordsInSection-1) {
			currentChord++;
		} else if (currentSection < numSections - 1) {
			currentSection++;
			currentChord = 0;
		} else {
			return [];
		}
		
		
		
		return [];
	}
	
}