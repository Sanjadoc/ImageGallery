package com.iomull.imageGallery.model.vo 
{
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class ImagePathVO 
	{
		public var name		:String = "";
		public var small	:String = "";
		public var big		:String = "";
		
		public function ImagePathVO(name:String, small:String, big:String):void
		{
			this.name	= name;
			this.small	= small;
			this.big 	= big;
		}
	}

}