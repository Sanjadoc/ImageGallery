package com.iomull.imageGallery.view.mediator 
{
	import com.iomull.imageGallery.model.ImageModel;
	import com.iomull.imageGallery.signals.ShowImageSignal;
	import com.iomull.imageGallery.view.BigContainer;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class BigContainerMediator extends Mediator
	{
		
		[Inject] public var view :BigContainer;
		[Inject] public var showImageSignal:ShowImageSignal;
		[Inject] public var imageModel:ImageModel;
		
		override public function onRegister():void
		{
			showImageSignal.add(onShowImage);
		}
		
		private function onShowImage():void 
		{
			view.addImage(imageModel.bigImage);
		}
		
	}

}