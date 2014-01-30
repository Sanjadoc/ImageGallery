package com.iomull.imageGallery.context 
{
	import com.iomull.imageGallery.controller.init.StartupAppCommand;
	import com.iomull.imageGallery.controller.init.StartupAppCompleteCommand;
	import com.iomull.imageGallery.signals.StartupAppCompleteSignal;
	import com.iomull.imageGallery.signals.StartupAppSignal;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.SignalContext;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class ImageGalleryContext extends SignalContext
	{
		public function ImageGalleryContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			signalCommandMap.mapSignalClass(StartupAppSignal, StartupAppCommand, true);
			signalCommandMap.mapSignalClass(StartupAppCompleteSignal, StartupAppCompleteCommand, true);
			
			var startupAppSignal:StartupAppSignal = injector.getInstance(StartupAppSignal);
			startupAppSignal.dispatch();
		}		
	}

}