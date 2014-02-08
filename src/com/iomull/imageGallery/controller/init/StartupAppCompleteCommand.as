package com.iomull.imageGallery.controller.init 
{
	import com.iomull.imageGallery.service.LoaderAppGallery;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author  Oleksandr Grynivskyi
	 */
	public class StartupAppCompleteCommand extends SignalCommand 
	{
		[Inject] public var loaderAppGallery:	LoaderAppGallery;
		
		override public function execute():void
		{
			//trace("StartupAppCompleteCommand ok");
			
			loaderAppGallery.loadData();
		}
		
	}

}