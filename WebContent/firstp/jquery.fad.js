;(function($) {

/*

* Jquery plugin for selecting table row....
* <div id="xxx"><div class="selectedBG"><table>..tr... input.. .tr..<table></div>
* $("#xxx").fad();
*
*@param {Object} options
*   'bgClass'         : class of div with active graphics,
*   'speed'           : animate speed [ms]
*   'classActiveTr'   : class of active TR ( should be cursor:hand for children )

*/

  $.fn.fad = function(options) {
  
    function fadAfterAnim(tr,FADdiv){
      FADdiv.find("input:checked").attr("checked","");
      tr.find("input").attr("checked","checked");
      FADdiv.find("tr").removeClass(opts.classActiveTr);
      tr.addClass(opts.classActiveTr);
    }

    var opts = $.extend({}, $.fn.fad.defaults, options);

return this.each(function() {

  var $this = $(this); 
  
  // init
  var position = $this.find("input:checked").parents("tr").attr("class",opts.classActiveTr).position();
  $("."+opts.classBgDiv).css("top", position.top);
  
  
  $this.find("table").find("td,th").live("click", function(e){
    
    thisTR = $(this).parents("tr")
    var position = thisTR.position();
    var animArg = {};
    animArg["top"] = position.top;
    $("."+opts.classBgDiv).animate(animArg, opts.speed,function() { fadAfterAnim(thisTR,$this) } );
    $("a.buy").attr("href", thisTR.attr("href") );
  });

});

   };

  // Plugin default options
  $.fn.fad.defaults = {
    'classBgDiv'          : 'fad-activeBG',
    'speed'               : 250,
    'classActiveTr'       : 'activeFAD'
  };

})(jQuery);
