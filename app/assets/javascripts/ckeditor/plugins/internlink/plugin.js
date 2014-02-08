CKEDITOR.plugins.add( 'internlink' );
//CKEDITOR.scriptLoader.load( CKEDITOR.plugins.getPath( 'internlink' ) + 'internpages.php' );

CKEDITOR.on( 'dialogDefinition', function( ev )
{
   var dialogName = ev.data.name;
   var dialogDefinition = ev.data.definition;
   
   if ( dialogName == 'link' )
   {
        var infoTab = dialogDefinition.getContents('info');
        
        infoTab.add( {
         type : 'select',
         id : 'intern',
         label : 'Link to Internal Page',
         'default' : '',
         style : 'width:100%',
         items : InternPagesSelectBox,
         onChange : function()
            {
                var d = CKEDITOR.dialog.getCurrent();
                d.setValueOf('info', 'url', this.getValue());
                d.setValueOf('info', 'protocol', !this.getValue() ? 'http://' : '');
            },
         setup : function( data )
         {
            this.allowOnChange = false;
            this.setValue( data.url ? data.url.url : '' );
            this.allowOnChange = true;
         }
        }, 'browse' );
        
        dialogDefinition.onLoad = function()
        {
            var internField = this.getContentElement( 'info', 'intern' );
            internField.reset();
        };
   }
} );
