package com.iomull.imageGallery.model 
{
	import com.iomull.imageGallery.view.BuildVersionView;
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
		
		private var buildVersion:BuildVersionView;
		
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
		
		public function addBuildVersionLayer():void
		{
			buildVersion = new BuildVersionView();
			buildVersion.name = "buildVersion";
			resizableContainer.addChild(buildVersion);
		}
		
	}

}