package com.banditrevolvers {
	
	import com.banditrevolvers.ScanLines;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class ScanLineMain extends MovieClip {
		
		public var testarea:SampleClip;
		public var button_1:MyButton;
		public var button_2:MyButton;
		public var button_3:MyButton;
		public var button_4:MyButton;
		public var button_5:MyButton;
		
		var mScanlines:ScanLines
		var mActiveButton:MyButton;
		
		public function ScanLineMain() {
			// constructor code
			
			mScanlines = new ScanLines();
			
			mScanlines.setDimensionsFromMovieClip(testarea);
			mScanlines.setPattern(ScanLines.PATTERN_HORIZONTAL);
			mScanlines.drawLines();			
			
			mScanlines.x = testarea.x;
			mScanlines.y = testarea.y;
			
			this.addChild(mScanlines);
			
			button_1.setText("Horizontal");
			swapButtonActivation(button_1);
			
			button_2.setText("Vertical");
			button_3.setText("Diagonal");
			button_4.setText("Grid");
			button_5.setText("Tone");
			
			button_1.addEventListener(MouseEvent.CLICK, buttonclick, false, 0, true);
			button_2.addEventListener(MouseEvent.CLICK, buttonclick, false, 0, true);
			button_3.addEventListener(MouseEvent.CLICK, buttonclick, false, 0, true);
			button_4.addEventListener(MouseEvent.CLICK, buttonclick, false, 0, true);
			button_5.addEventListener(MouseEvent.CLICK, buttonclick, false, 0, true);
			
		}
		
		public function buttonclick(event:Event):void {
			var btn:MyButton = event.currentTarget as MyButton;
			var idstr:int = int(btn.name.split('_')[1]);
			
			switch(idstr) {
				case 1:
					mScanlines.setPattern(ScanLines.PATTERN_HORIZONTAL);
					mScanlines.setColors(ScanLines.COLORS_BLACK);
					mScanlines.drawLines();
				break;				
				case 2:
					mScanlines.setPattern(ScanLines.PATTERN_VERTICAL);
					mScanlines.setColors(ScanLines.COLORS_BLACK);
					mScanlines.drawLines();					
				break;
				case 3:
					mScanlines.setPattern(ScanLines.PATTERN_DIAGONAL);
					mScanlines.setColors(ScanLines.COLORS_BLACK);
					mScanlines.drawLines();					
				break;		
				case 4:
					mScanlines.setPattern(ScanLines.PATTERN_GRID);
					mScanlines.setColors(ScanLines.COLORS_BLACK);
					mScanlines.drawLines();					
				break;						
				case 5:
					//mScanlines.setPattern(ScanLines.PATTERN_HORIZONTAL);
					var pat:Array = [[0,1, 2],
												[0,1, 2],
												[0, 1, 2]];
					var col:Array = [0x4000FF00, 0x400CC000, 0x4000AA00];
					mScanlines.setPatternAndColors(pat, col);
					mScanlines.drawLines();					
				break;						
				
			}
			
			swapButtonActivation(btn);
			
		}
		
		private function swapButtonActivation(btn:MyButton):void {
			if (mActiveButton != null) {
				mActiveButton.setActive(false);
			}
			mActiveButton = btn;
			mActiveButton.setActive(true);
		}
	}
	
}
