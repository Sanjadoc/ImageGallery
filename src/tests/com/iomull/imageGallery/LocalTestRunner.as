package tests.com.iomull.imageGallery 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;
	import tests.com.iomull.imageGallery.model.ConfigModelTest;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class LocalTestRunner extends Sprite 
	{
		public function LocalTestRunner():void 
		{
			if (stage) runTest();
			else addEventListener(Event.ADDED_TO_STAGE, runTest);
		}
		
		private var core:FlexUnitCore;
		
		public function runTest(e:Event = null): void
		{
			core = new FlexUnitCore();
			core.addListener( new TraceListener());
			core.run( ConfigModelTest );
		}
		
	}
	
}



