package com.banditrevolvers {
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelani Harris
	 */
	public class ScanLines extends Sprite	{
		
		//Patterns
		public static const PATTERN_VERTICAL:Array = 	[[1, 0]]; 
		public static const PATTERN_HORIZONTAL:Array = 	[[1], [0]];
		public static const PATTERN_GRID:Array 	= 		[[1, 0],
														 [1, 0]];
		public static const PATTERN_DIAGONAL:Array = 	[[0, 0, 1],
														 [0, 1, 0],									
														 [1, 0, 0]];												
		
		//Colors
		public static const COLORS_BLACK:Array = [0x40000000, 0x00FFFFFF];
		
		private var mPattern:Array;
		private var mColors:Array;
		
		private var mWidth:uint;
		private var mHeight:uint;
		
		public function ScanLines() {
			setPatternAndColors(PATTERN_HORIZONTAL, COLORS_BLACK);
			//drawLines();
		}
		
		public function setDimensionsFromMovieClip(mov:MovieClip):void {
			setWidth(mov.width);
			setHeight(mov.height);
		}
		
		public function setPositionFromMovieClip(mov:MovieClip):void {
			this.x = mov.x;
			this.y = mov.y;
		}
		
		public function setWidth(val:uint):void { mWidth = val; }
		public function setHeight(val:uint):void { mHeight = val; }
		
		public function drawLines():void {
			//Clear out the sprite
			this.graphics.clear();
			if (mPattern.length > 0) {
				//Create our tile with our pattern and color information
				var data:BitmapData = createTile();
				
				//Fill our sprite with our tile
				this.graphics.beginBitmapFill(data);
				this.graphics.drawRect(0, 0, mWidth, mHeight);			
				this.graphics.endFill();
			}
		}
		
		public function createTile():BitmapData {
			var pat_columns:int = mPattern[0].length;		
			var pat_rows:int = mPattern.length;	
			
			var bit_data:BitmapData = new BitmapData(pat_columns, pat_rows, true, 0x0);			
			for (var pixel_y:int = 0; pixel_y < pat_rows; pixel_y++) {
				for (var pixel_x:int = 0; pixel_x < pat_columns; pixel_x++) {
					
					var pixel_color:int = mColors[mPattern[pixel_y][pixel_x]];
					
					bit_data.setPixel32(pixel_x, pixel_y, pixel_color);
				}
			}
			return bit_data;			
		}
		
		public function getPattern():Array { return mPattern; }
		public function getColors():Array { return mColors; }
		
		public function setPattern(pat:Array):void { 
			mPattern = pat;
		}
		
		public function setPatternAndColors(pat:Array, col:Array):void {
			mPattern = pat;
			mColors = col;
		}
		
		public function setColors(col:Array):void { 
			mColors = col;
		}
		
		public function clearPattern():void {
			mPattern = [];
		}
		
	}
}