/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	 config.language = 'En';
    // config.uiColor = '#AADC6E';
 //   config.filebrowserBrowseUrl = 'http:/FileBrowser/FileBrowser.aspx?type=files';
  //  config.filebrowserImageBrowseUrl = 'http:/FileBrowser/FileBrowser.aspx?type=images';
    //config.filebrowserFlashBrowseUrl = 'http:/FileBrowser/FileBrowser.aspx?type=flash';
    config.extraPlugins = 'uploadimage';
   // config.extraPlugins = 'uploadwidget';
    //config.extraPlugins = 'filetools';
    //config.extraPlugins = 'notification';
    //config.extraPlugins = 'toolbar';
    //config.extraPlugins = 'button';
  //  config.extraPlugins = 'notificationaggregator';
    config.uploadUrl = "../fileupload.ashx";
   // config.mathjax = "FileBrowser/MyUpload.ashx";
    config.mathJaxLib = '//cdn.mathjax.org/mathjax/2.6-latest/MathJax.js?config=TeX-AMS_HTML';
   // config.filetools = '~/FileBrowser/MyUpload.ashx';
   
   
   
};
