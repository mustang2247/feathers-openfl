/*
Feathers
Copyright 2012-2014 Joshua Tynjala. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.core;
/**
 * Handles the editing of text, and supports multiline editing. This is not
 * a text editor intended for a <code>TextArea</code> component. Instead,
 * its a text editor intended for a <code>TextInput</code> component and it
 * is expected to provide its own scroll bars.
 *
 * @see feathers.controls.TextInput
 * @see http://wiki.starling-framework.org/feathers/text-editors
 */
interface IMultilineTextEditor extends ITextEditor
{
	/**
	 * Indicates whether the text editor can display more than one line of
	 * text.
	 */
	function get_multiline():Bool;

	/**
	 * @private
	 */
	function set_multiline(value:Bool):Void;
}
