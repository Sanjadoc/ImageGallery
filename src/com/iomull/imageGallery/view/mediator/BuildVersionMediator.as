package com.iomull.imageGallery.view.mediator 
{
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.view.BuildVersionView;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class BuildVersionMediator extends Mediator 
	{
		[Inject] public var stage			:Stage;
		[Inject] public var configModel		:ConfigAppModel;
		[Inject] public var view			:BuildVersionView;
	
		override public function onRegister():void
		{
			stage.addEventListener( KeyboardEvent.KEY_UP, onKeyUp );
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			//"Press: Ctrl" + "Shift" + "B"
			if ( e.ctrlKey && e.shiftKey && e.keyCode == 66 )
				view.switchBuildNumberView(configModel.buildID);
		}
		
	}

}