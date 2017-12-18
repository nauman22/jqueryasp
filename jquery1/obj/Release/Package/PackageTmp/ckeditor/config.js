/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'forms' },
		{ name: 'tools' },
		{ name: 'document', groups: ['mode', 'document', 'doctools'] },
        { name: 'mathjax' },
        {name:'widget'},
		{ name: 'others' },
		//'/',
		{ name: 'basicstyles', groups: [ 'basicstyles'] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		{ name: 'styles' },
		{ name: 'colors' },
        {name : 'wysiwygarea'},
        { name: 'easykeymap' },//,
		{ name: 'about' }
	];

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	//config.removeButtons = 'Underline,Subscript,Superscript';
	//config.extraPlugins = 'mathjax';
	//config.extraPlugins = 'widget';
	config.extraPlugins = 'wysiwygarea';
	config.extraPlugins = 'easykeymap';
	//config.extraPlugins = 'image';
	config.extraPlugins = 'dialog';
	config.extraPlugins = 'dialogui';
	config.extraPlugins = 'mathjax';
	config.extraPlugins = 'lineutils';

	//config.filebrowserBrowseUrl = 'http:/FileBrowser/FileBrowser.aspx?type=files';
	//config.filebrowserImageBrowseUrl = 'http:/FileBrowser/FileBrowser.aspx?type=images';
	//config.filebrowserFlashBrowseUrl = '/FileBrowser/FileBrowser.aspx?type=flash';
	//config.extraPlugins = 'uploadimage';
	//config.uploadUrl = '~/fileupload.ashx';
	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';
   // var element = CKEDITOR.dom.element.createFromHtml( '<img src="hello.png" border="0" title="Hello" />' );
//CKEDITOR.instances.editor1.insertElement( element );
	config.easykeymaps = {
	    4456530: String.fromCharCode(174),   //ALT + R
	    4456515: String.fromCharCode(169)   //ALT + C
	};
	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	config.width = '100%';
	config.height = '50px';
	config.removePlugins = false;
	
};
