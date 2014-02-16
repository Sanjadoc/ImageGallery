package com.iomull.imageGallery.view 
{
	import com.greensock.loading.display.ContentDisplay;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class BigContainer extends Sprite
	{
		private var _image:ContentDisplay;
		private var _tempImage:ContentDisplay;
		
		public function addImage(image:ContentDisplay):void
		{
			_tempImage = image;
			
			if (_image && this.contains(_image))
				removeImage();
			else
				addNewImage();
		}
		
		private function removeImage():void 
		{
			TweenLite.to( _image , 0.5, { alpha:0, onComplete:removeImageEnd } );
		}
		
		private function removeImageEnd():void 
		{
			this.removeChild(_image);
			_image = null;
			addNewImage();
		}
		
		private function addNewImage():void 
		{
			_image = _tempImage;
			_image.alpha = 0;
			this.addChild(_image);
			TweenLite.to( _image , 0.5, { alpha:1 } );
		}
		
	}

}