package com.iomull.imageGallery.controller.init 
{
	import com.iomull.imageGallery.constant.LoadName;
	import com.iomull.imageGallery.constant.LoadType;
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.service.LoaderAppGallery;
	import com.iomull.imageGallery.signals.ImageXMLLoadedSignal;
	import com.iomull.imageGallery.signals.LaunchAppSignal;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author  Oleksandr Grynivskyi
	 */
	public class StartupAppCompleteCommand extends SignalCommand 
	{
		[Inject] public var loaderAppGallery	:LoaderAppGallery;
		[Inject] public var configAppModel		:ConfigAppModel;
		[Inject] public var imageXMLLoadedSignal:ImageXMLLoadedSignal;
		[Inject] public var launchAppSignal		:LaunchAppSignal;
		
		override public function execute():void
		{
			loaderAppGallery.addData(LoadType.XML, LoadName.IMAGE_XML, configAppModel.xmlPath, imageXMLLoadedSignal );
			loaderAppGallery.load();
			
			launchAppSignal.dispatch();
		}
		
	}

}