package com.iomull.imageGallery.model.vo 
{
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class ImagePathVO 
	{
		public var smallImage	:String = "";
		public var bigImage		:String = "";
		
		public function ImagePathVO(smallImage:String, bigImage:String):void
		{
			this.smallImage = smallImage;
			this.bigImage 	= bigImage;
		}
	}

}