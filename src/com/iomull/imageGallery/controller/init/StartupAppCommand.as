package com.iomull.imageGallery.controller.init 
{
	import com.iomull.imageGallery.controller.load.ImagesLoadedCommand;
	import com.iomull.imageGallery.controller.load.ImageXMLLoadedCommand;
	import com.iomull.imageGallery.controller.load.SignalParseCompleteCommand;
	import com.iomull.imageGallery.model.api.IStateModel;
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.model.ImageModel;
	import com.iomull.imageGallery.model.StateModel;
	import com.iomull.imageGallery.model.ViewAppModel;
	import com.iomull.imageGallery.service.LoaderAppGallery;
	import com.iomull.imageGallery.signals.ImagesLoadedSignal;
	import com.iomull.imageGallery.signals.ImageXMLLoadedSignal;
	import com.iomull.imageGallery.signals.LaunchAppSignal;
	import com.iomull.imageGallery.signals.ShowImageSignal;
	import com.iomull.imageGallery.signals.SignalParseComplete;
	import com.iomull.imageGallery.signals.StartupAppCompleteSignal;
	import com.iomull.imageGallery.view.BigContainer;
	import com.iomull.imageGallery.view.mediator.BigContainerMediator;
	import flash.display.Stage;
	import org.robotlegs.mvcs.SignalCommand;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class StartupAppCommand extends SignalCommand
	{
		[Inject]
		public var startupAppCompleteSignal:StartupAppCompleteSignal;
		
		override public function execute():void
		{
			injector.mapSingleton(ConfigAppModel);
			injector.mapSingleton(ViewAppModel);
			injector.mapSingleton(StateModel);
			injector.mapSingleton(ImageModel);
			injector.mapSingleton(ShowImageSignal);
			injector.mapSingletonOf(IStateModel, StateModel);
			injector.mapSingletonOf(LoaderAppGallery, LoaderAppGallery);
						
			signalCommandMap.mapSignalClass(LaunchAppSignal, LaunchAppCommand, true);
			signalCommandMap.mapSignalClass(ImageXMLLoadedSignal, ImageXMLLoadedCommand, true);
			signalCommandMap.mapSignalClass(SignalParseComplete, SignalParseCompleteCommand, true);
			signalCommandMap.mapSignalClass(ImagesLoadedSignal,ImagesLoadedCommand);
			
			mediatorMap.mapView(BigContainer, BigContainerMediator, BigContainer);
			
			startupAppCompleteSignal.dispatch();
		}
	}

}