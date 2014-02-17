package com.iomull.imageGallery.model.api 
{
	/**
	 * ...
	 * @author Olexandr Grynivsky
	 */
	public interface IStateModel 
	{
		function get smallImages():Vector.<int>;
		function set smallImages(value:Vector.<int>):void;
		
		function get bigImages():Vector.<int>;
		function set bigImages(value:Vector.<int>):void;
		
		function get selectedName():String;
		function set selectedName(value:String):void;
	}

}