package com.iomull.imageGallery.model 
{
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
		public var resizableContainer:Sprite;
		
		public function createApplication(contextView:DisplayObjectContainer):void
		{
			this.contextView = contextView;
			addResizableContainer();
		}
		
		public function addResizableContainer():void
		{
			resizableContainer = new Sprite();
			resizableContainer.graphics.clear();
			
			contextView.addChild(resizableContainer);
		}
		
	}

}