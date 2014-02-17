package com.iomull.imageGallery.view.mediator 
{
	import com.iomull.imageGallery.model.api.IStateModel;
	import com.iomull.imageGallery.model.ImageModel;
	import com.iomull.imageGallery.signals.SelectedImageSignal;
	import com.iomull.imageGallery.signals.ShowImageSignal;
	import com.iomull.imageGallery.view.signal.ClickSignal;
	import com.iomull.imageGallery.view.SmallContainer;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class SmallContainerMediator extends Mediator
	{
		
		[Inject] public var view :SmallContainer;
		[Inject] public var showImageSignal:ShowImageSignal;
		[Inject] public var selectedImageSignal:SelectedImageSignal;
		[Inject] public var imageModel:ImageModel;
		[Inject] public var stateModel:IStateModel;
		
		override public function onRegister():void
		{
			showImageSignal.add(onShowImage);
			view.clickSignal.add(onClick);
		}
		
		private function onShowImage():void 
		{
			view.addImage(imageModel.smallImages);
		}
		
		private function onClick(name:String):void 
		{
			stateModel.selectedName = name;
			selectedImageSignal.dispatch();
		}
		
	}

}