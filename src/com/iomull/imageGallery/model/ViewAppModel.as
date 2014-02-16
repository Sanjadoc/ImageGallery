package com.iomull.imageGallery.model 
{
	import com.iomull.imageGallery.view.BigContainer;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Oleksandr Grynivsky
	 */
	public class ViewAppModel extends Actor 
	{
		private var contextView:DisplayObjectContainer;
		
		private var bigContainer:BigContainer;
		
		public function createApplication(contextView:DisplayObjectContainer):void
		{
			this.contextView = contextView;
			addBigContainer();
		}
		
		public function addBigContainer():void
		{
			bigContainer = new BigContainer();
			bigContainer.name = "bigContainer";
			bigContainer.x = (contextView.stage.stageWidth - 400) >> 1;
			bigContainer.y = 40;
			contextView.addChild(bigContainer);
		}
		
	}

}