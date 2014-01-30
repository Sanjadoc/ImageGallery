package com.iomull.imageGallery.controller.init 
{
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.model.ViewAppModel;
	import com.iomull.imageGallery.signals.LaunchAppSignal;
	import com.iomull.imageGallery.signals.StartupAppCompleteSignal;
	import com.iomull.imageGallery.view.BuildVersionView;
	import com.iomull.imageGallery.view.mediator.BuildVersionMediator;
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
			//injector.mapSingleton(Models or Services);
			//signalCommandMap.mapSignalClass(Signal,Command);
			//mediatorMap.mapView(Views);

			injector.mapSingleton(ConfigAppModel);
			injector.mapSingleton(ViewAppModel);
						
			signalCommandMap.mapSignalClass(LaunchAppSignal, LaunchAppCommand);
			
			mediatorMap.mapView(BuildVersionView, BuildVersionMediator, BuildVersionView);
			
			startupAppCompleteSignal.dispatch();
		}
	}

}