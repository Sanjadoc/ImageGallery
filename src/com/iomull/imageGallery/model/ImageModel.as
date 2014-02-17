package com.iomull.imageGallery.model 
{
	import com.greensock.loading.display.ContentDisplay;
	import org.robotlegs.mvcs.Actor;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */

	public class ImageModel  extends Actor
	{
		public var bigImage:ContentDisplay; 
		public var smallImages:Vector.<ContentDisplay>;
	}

}