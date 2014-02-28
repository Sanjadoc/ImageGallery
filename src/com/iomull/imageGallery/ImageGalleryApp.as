package com.iomull.imageGallery 
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.iomull.imageGallery.context.ImageGalleryContext;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	[SWF(width = "740", height = "500", backgroundColor = "#001010", frameRate = "30")]
	
	public class ImageGalleryApp extends MovieClip 
	{
		private var context:ImageGalleryContext;
		public function ImageGalleryApp() 
		{
			if (stage)
				init(null)
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//
			MonsterDebugger.initialize(this);
			//
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			//
			context = new ImageGalleryContext(this, true);
		}
	}
}