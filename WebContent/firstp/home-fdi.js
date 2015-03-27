var prHash = "";
var cnetTracking = false;
$.browser.chrome = /chrome/.test(navigator.userAgent.toLowerCase());


$(document).ready(function(){
	//if(!$.browser.chrome){
	if(!$.browser.chrome && $(".google-chrome-p").length > 0){
		if( typeof(s) !== "undefined" ){
			s.linkTrackEvents = s.events = "event15";
			s.eVar1="D=server";
			s.eVar2 = locale;
			s.eVar4="D=pageName";
			s.eVar7="D=g";
			
			s.linkTrackVars = "events,eVar1,eVar2,eVar4,eVar7";
			s.tl(true,'o','D=pageName');
			s.linkTrackEvents = s.events = null;
		}
		var url = document.location.href;
		if (url.indexOf("?") > -1) {
			url = url.substr(0, url.indexOf("?"));
		}
		if(typeof _gaq !== "undefined"){
			_gaq.push(['_trackEvent','Chrome_offer', 'View', url]);
		}
    
    // 2013/02/20 Implemented inline
    // 2012/10/12 Ales: Fixing fire event
	/*$(document).on('click', 'a.google-chrome', function(){
      if(typeof _gaq !== "undefined"){
  			_gaq.push(['_trackEvent','Chrome_offer', 'Accept', url]);
      }  
    });*/
	}
	
	/*$(window).bind('hashchange', function(event) {
		if(prHash == "#FDI"){
		    $("#download_lightbox").remove();
		    $("#lightbox").remove();
		}
		prHash = window.location.hash;
	});*/
	//avast.counter.init();

    /* split for FR-FR, FR-BE, FR-CH */
    if(locale == 'fr-fr' || locale == 'fr-ch' || locale == 'fr-be'){
        if($.browser.chrome){
          $("a.download").attr('href','http://www.01net.com/editeur/Alwill/Avast/chrome.html');
          $(".download-from-text").text('depuis le site 01net.com');
        }

        if($.browser.msie){
            $("a.download").attr('href','http://www.01net.com/editeur/Alwill/Avast/ie.html');
            $(".download-from-text").text('depuis le site 01net.com');
        }

        if($.browser.mozilla){
            $("a.download").attr('href','http://www.01net.com/editeur/Alwill/Avast/ff.html');
            $(".download-from-text").text('depuis le site 01net.com');
        }
    }


	/*Hide chrome store for chrome users*/
	$.browser.chrome = /chrome/.test(navigator.userAgent.toLowerCase());
	if($.browser.chrome){
	    $("a.google-chrome").parent().addClass("empty").html("");
	}
  
	// Remove onclick tracking from all download buttons
	$("a.download, a.download-nofdi").each(function(){
	    if($(this).attr("onclick") != undefined) {
	    $(this).removeAttr("onclick");
	    }
	});

	// CNET tracking
  // Do not alter download url below this line !!!
  if($("a.download").length > 0){
    if($("a.download").attr('href').indexOf('download.cnet.com') != -1){
	cnetTracking = true;
    }
  }else if($("a.download-nofdi").length > 0){
    if($("a.download-nofdi").attr('href').indexOf('download.cnet.com') != -1){
	cnetTracking = true;
    }
  }

	$('a.download').live('click',function(e){
		   if(e.preventDefault) e.preventDefault();
       //initFDI();
       if(cnetTracking){
          $("body").append('<img src="http://dw.com.com/clear/c.gif?sId=17&ctype=avast&cval=cod" border="0" height="1" width="1" alt="" />');
       }
       window.location.hash = "FDI";
	});
 
  $("a.download-nofdi").live('mousedown',function(e){
    var faHREF = $(this).attr('href');
    var buttonHref =  $('#button-free-href').attr('href');
    var regexpDLHOST = /((https?\:\/\/(www\.)?|www\.)(([\w|\-]+\.)+(\w+)))([\/#\?].*)?/ig;
    var matchDLHOST = regexpDLHOST.exec(buttonHref);
    var s=s_gi(s_account);
    s.trackExternalLinks=false;  //turn off auto exit link tracking
    s.linkTrackVars='eVar4,eVar6,eVar24,eVar25,eVar26,events';
    s.linkTrackEvents='event9,event10';
    if(typeof freeChallenger !== "undefined"){
	s.eVar6 = freeChallenger;
    }
    if(matchDLHOST != null) s.eVar24=matchDLHOST[4];  //download host name
    else s.eVar24 = "files.avast.com";
    s.eVar25='FA';  //download file name
    s.eVar26=faHREF;  //download URL
    s.events='event9,event10';
    s.tl(this,'d','External File Download');

    if(typeof _gaq !== "undefined"){
      _gaq.push(['_trackEvent','Download', 'FA', buttonHref]);
      _gaq.push(['_trackEvent','CoD', 'FA', buttonHref]);
    }

    if(cnetTracking){
       $("body").append('<img src="http://dw.com.com/clear/c.gif?sId=17&ctype=avast&cval=cod" border="0" height="1" width="1" alt="" />');
       if(s !== undefined){
	    cnetLink = faHREF;
	    var s6 = (typeof s_tev == "undefined")?"undefined":s_tev;
	    if(cnetLink.indexOf('?') == -1){
		//cnetLink += "?v6="+s6+"&v7="+encodeURIComponent(document.URL)+"&v24="+s.eVar24+"&v25="+s.eVar25;
	    }
	    else{
		//cnetLink += "&v6="+s6+"&v7="+encodeURIComponent(document.URL)+"&v24="+s.eVar24+"&v25="+s.eVar25;
	    } 
	}
    }
		
  });
  
  $("a.download-nofdi").live('click',function(e){
      if(typeof cnetLink != "undefined"){
	  window.location = cnetLink;
	  return false;
      }
  });
  

  if(window.location.hash == "#FDI"){
    initFDI();
  }

  $(window).hashchange( function(){
     if(window.location.hash != "#FDI"){
      $("#lightbox").remove();
      $("#download_lightbox").remove();
      if(avast.secondsCounter.timer != null){
        clearInterval(avast.secondsCounter.timer);
        avast.secondsCounter.timer = null;
      }
      // 2013/02/20 AG: graphicCounter already not in use on v8
      /*if(avast.graphicCounter.timer != null){
        clearInterval(avast.graphicCounter.timer);
        avast.graphicCounter.timer = null;
      }*/
      if (!document.all) $('body').css({'overflow':'auto'});
     }
     else{
        initFDI();
     }
  });

  $("#backup-product").addClass("pointer-backp").click(function(e){
		window.location = $(this).find(".button").attr('href');
		return false;
	});

  function initFDI(){
    window.location.hash = "FDI";
		
		var inc = ($(".mBoxTesting").length>0)?$(".mBoxTesting").html():$("#free2is").html();
		var message = "<div id='download_lightbox' style='width: 740px;'>" + inc + "</div>";
	    var scr = "<div id='lightbox'></div>";
	    var buttonHref =  $('#button-free-href').attr('href');

	    $('body').append(message);
	    $('body').append(scr);

	    var iebody=(document.compatMode && document.compatMode != "BackCompat")? document.documentElement : document.body;
	    var topPosition=document.all? iebody.scrollTop : pageYOffset;

	    $("#download_lightbox").css({"background-color":"white", "border":"8px solid #2e3640","-khtml-border-radius": "6px","border-radius": "6px","-webkit-border-radius":"6px","-moz-border-radius": "6p", "padding":"10px 15px 15px 15px", "position":"absolute", "z-index":"888"});
	    $("#download_lightbox").css({'display': 'block', 'top':topPosition + 150, 'left': $(window).width()/2 - 385});
	    $("#download_lightbox").show();

	    $('#lightbox').css({opacity:0,'width':$(document).width(),'height':$(document).height(),'z-index':'887','background-color':'black','position':'absolute'});
			$("#lightbox").css({'display': 'block', 'top':0, 'left': 0});
	    $("#lightbox").show();
			$('#lightbox').animate({ opacity: 0.6},150);

	    if (!document.all) $('body').css({'overflow':'auto'});

	    if(typeof _gaq !== "undefined"){
	    	_gaq.push(['_trackEvent','CoD', 'FA', buttonHref]);
	    }
	    $(".button-free").removeAttr("href");
	    $(".button-free").attr("href", buttonHref);
	    
	    //if(parseInt($.browser.version) < 9){
    		if(avast.secondsCounter !== undefined){ 
          avast.secondsCounter.init({onComplete:function(){
    			    trackingDecline();
              
              if(typeof _gaq !== "undefined"){
                _gaq.push(['_trackEvent','Download', 'FA', buttonHref]);
    				    _gaq.push(['_trackEvent','Free Pop-up', $(".lightbox_close").attr("alt"), 'Count out']);
    			    }
    			    window.location = $(".button-free").attr('href');
    			}});
    		}

		// tracking products - get products ID
		var ar=0;
		var res=new Array(); // array of products ID

		$("#download_lightbox .fad-price table tr").each(function(){
		  href=$(this).attr("href");

		  var myregexp = /PRODUCT\[([^\]]+)/ig; //regexp for ID from PRODUCT[111111111]
		  var match = myregexp.exec(href);
		  im=0;
		  while (match != null) { //get all matches
		    if (im>0)
		      res[ar] += "-" + match[1]; // for 2 or more product in URL - separated by "-"
		      else
		        res[ar] = match[1];
		  	match = myregexp.exec(href);
		  	im++;
		  }
		  ar++;

		});

		// Products ID for s.eVar23 separated by ","  12121,2125454,454545 ....
		pID="";
		for(i=0;i<res.length;i++){
		  if (i==0)
		    mezera = "";
		    else
		      mezera = ",";
		  pID += mezera + res[i];
		}


		//tracking FDI init
		//s_tev = null;
		
		var s=s_gi(s_account);
		var faHREF = $(this).attr('href');
    var buttonHref =  $('#button-free-href').attr('href');
      var regexpDLHOST = /((https?\:\/\/(www\.)?|www\.)(([\w|\-]+\.)+(\w+)))([\/#\?].*)?/ig;
      var matchDLHOST = regexpDLHOST.exec(buttonHref);     
  		var s=s_gi(s_account);
  		s.trackExternalLinks=false;  //turn off auto exit link tracking
  		s.linkTrackVars='eVar4,eVar6,eVar23,eVar24,eVar25,eVar26,events';
  		s.linkTrackEvents='event1,event9';
  		s.pageName='Products | Interstitial';  //overlay page name
  		s.eVar23=pID;  //offer product ID(s)
  		if(matchDLHOST != null) s.eVar24=matchDLHOST[4];  //download host name
  		else s.eVar24 = "files.avast.com";
  		s.eVar25='FA';  //download file name
  		s.eVar26=buttonHref;  //download URL
  		s.events='event9';
  		s.tl(true,'o','D=pageName');
      
		
  		/*
  		var s=s_gi(s_account);
		s.trackExternalLinks=false;  //turn off auto exit link tracking
		s.linkTrackVars='eVar4,eVar23,events';
		s.linkTrackEvents='event9';  //interstitial offer
		s.pageName='Products | Interstitial';  //overlay page name
		s.eVar4='D=pageName'
		s.eVar23=pID;  //offer product ID(s)
		s.events='event9';  //interstitial offer
		s.tl(true,'o','D=pageName');  //no time delay
		// - tracking products end
		*/


    $("#lightbox").live('click',function() {
			if(!$("#free2is").hasClass("t-000-046-challenger-1")) { //free popup noclose test

				trackingDecline();

        $("#lightbox").remove();
        $("#download_lightbox").remove();
        if (!document.all) $('body').css({'overflow':'auto'});
        if(typeof _gaq !== "undefined"){
          _gaq.push(['_trackEvent','Download', 'FA', buttonHref]);
        	_gaq.push(['_trackEvent','Free Pop-up', $(".lightbox_close").attr("alt"), 'Click out']);
        }
        if(typeof cnetLink != "undefined"){
	    window.location = cnetLink;
	    return false;
	}
	window.location = $(".button-free").attr('href');
      }
    });

    $(".lightbox_download a").live('click',function() {
        $("#lightbox").remove();
        $("#download_lightbox").remove();
        if (!document.all) $('body').css({'overflow':'auto'});
    });


    $(".lightbox-bottom a.buy").live('click',function() {
    	if(typeof _gaq !== "undefined"){
    		_gaq.push(['_trackEvent','Free Pop-up', $(".lightbox_close").attr("alt"), 'Upgrade button']);
    	}

      var s=s_gi(s_account);
      s.linkTrackVars='events';
      s.linkTrackEvents='event2';
      s.events='event2';  //interstitial offer accept
      s.tl(this,'o','Products | Interstitial | Accept');  //includes 500ms delay
    });

    $(".lightbox-bottom a.button-free").live('click',function() {
    	if(typeof _gaq !== "undefined"){
        _gaq.push(['_trackEvent','Download', 'FA', buttonHref]);
    	_gaq.push(['_trackEvent','Free Pop-up', $(".lightbox_close").attr("alt"), 'Free button']);
    	}

    	trackingDecline();
	if(typeof cnetLink != "undefined"){
	    window.location = cnetLink;
	    return false;
	}
    });


    $(".lightbox_close").live('click',function() {


     trackingDecline();
      $("#lightbox").remove();
      $("#download_lightbox").remove();
      if (!document.all) $('body').css({'overflow':'auto'});
      if(typeof _gaq !== "undefined"){
        _gaq.push(['_trackEvent','Download', 'FA', buttonHref]);
    	  _gaq.push(['_trackEvent','Free Pop-up', $(".lightbox_close").attr("alt"), 'X close button']);
      }
      if(typeof cnetLink != "undefined"){
	    window.location = cnetLink;
	    return false;
	}
        window.location = $(".button-free").attr('href');
    });

    $("#download_lightbox .fad-price").fad();

		/*$(".fad-price").click(function() {
		$("a.buy").attr("href", $(this).attr("href") );
		//alert("neco");
		$.each($(".fad-price"), function() {
		  $(this).removeClass("fad-price-active");
		});
		$(this).addClass("fad-price-active");
		});*/
  }

	//tracking  Decline/Download*
	function trackingDecline(){
		//var ip = $('a.download').data('ip');
		
		var faHREF = $('a.download').attr('href');
		var myregexpHOST = /((https?\:\/\/(www\.)?|www\.)(([\w|\-]+\.)+(\w+)))([\/#\?].*)?/ig;
		var matchHOST = myregexpHOST.exec(faHREF);
		//alert (matchHOST[4]);        
		var s=s_gi(s_account);
		s.trackExternalLinks=false;  //turn off auto exit link tracking
		s.linkTrackVars='eVar4,eVar6,eVar24,eVar25,eVar26,events';
		s.linkTrackEvents='event10';
		if(matchHOST != null) s.eVar24=matchHOST[4];  //download host name
		else s.eVar24 = "files.avast.com";
		s.eVar25='FA';  //download file name
		s.eVar26=faHREF;  //download URL
		s.events='event10';
		s.tl(this,'d','External File Download');
		
		if(cnetTracking){
		    $("body").append('<img src="http://dw.com.com/clear/c.gif?sId=17&ctype=avast&cval=redir" border="0" height="1" width="1" alt="" />');
		    if(s !== undefined){
			cnetLink = faHREF;
			var s6 = (typeof s_tev == "undefined")?"undefined":s_tev;
			if(cnetLink.indexOf('?') == -1){
			    //cnetLink += "?v6="+s6+"&v7="+encodeURIComponent(document.URL)+"&v24="+s.eVar24+"&v25="+s.eVar25;
			    
			}
			else{
			    //cnetLink += "&v6="+s6+"&v7="+encodeURIComponent(document.URL)+"&v24="+s.eVar24+"&v25="+s.eVar25;
			} 
		    }
		}
	}
    
    // Dynamic mbox testing    
    $('body').on('mouseup', 'a, img', function(e){
          var $this = $(this);
          if (typeof mbox === "function" && $this.data("mbox")) {
            // if(typeof console !== "undefined"){
            //   console.log($this.data('mbox'));
            // }
            mboxDefine($this.data("mbox")[0], $this.data("mbox")[1]);
            mboxUpdate($this.data("mbox")[1]);
          }
    });
});