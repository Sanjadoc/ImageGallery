package com.iomull.imageGallery.view 
{
	import com.greensock.loading.display.ContentDisplay;
	import com.greensock.TweenLite;
	import com.iomull.imageGallery.view.signal.ClickSignal;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class SmallContainer extends Sprite
	{
		private var _images:Vector.<ContentDisplay>;
		private var _tempImages:Vector.<ContentDisplay>;
		
		public var clickSignal:ClickSignal = new ClickSignal();
		
		public function SmallContainer()
		{
			initListener();
		}
		
		public function addImage(images:Vector.<ContentDisplay>):void
		{
			_tempImages = images;
			if(_images)
				removeOldImages();
				
			_images = _tempImages;
			addNewImages();
		}
		
		private function initListener():void 
		{
			this.addEventListener(MouseEvent.CLICK, imageClick, true);
			//this.mouseChildren = false;
			this.buttonMode = true;
		}
		
		private function addNewImages():void 
		{
			for ( var i:int = 0; i < _images.length; i++ )
			{
				var image:ContentDisplay = _images[i];
				image.x = (image.width + 3) * i;
				this.addChild(image);
			}
		}
		
		private function removeOldImages():void 
		{
			for ( var i:int = 0; i < _images.length; i++ )
			{
				var image:ContentDisplay = _images[i];
				if (image && this.contains(image))
				{
					this.removeChild(image);
					image = null;
				}
			}
			_images.length = 0;
		}
		
		private function imageClick(e:MouseEvent):void 
		{
			var image:ContentDisplay = e.target as ContentDisplay;
			clickSignal.dispatch(image.name);
			
			image.alpha = 0;
			TweenLite.to( image , 0.7, { alpha:1} );
		}
	}

}