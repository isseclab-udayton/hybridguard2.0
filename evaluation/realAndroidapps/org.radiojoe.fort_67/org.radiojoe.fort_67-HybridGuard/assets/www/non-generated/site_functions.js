function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location=\'"+selObj.options[selObj.selectedIndex].value+"\'");
  if (restore) selObj.selectedIndex=0;
}


function make_slideshow(id, images, next_page)
{
    if ( typeof make_slideshow.counter == 'undefined' ) {
        // It has not... perform the initilization
        make_slideshow.counter = 0;
    }
    make_slideshow.counter++;

    var element = document.getElementById(id);

    if (images.length == make_slideshow.counter) {
        location.href = next_page;
    }
    else {
        element.src = 'media/' + images[make_slideshow.counter];
    }
}

function clickclear(thisfield, defaulttext) 
{
    if (thisfield.value == defaulttext) {
        thisfield.value = "";
    }
}

function clickrecall(thisfield, defaulttext) 
{
    if (thisfield.value == "") {
        thisfield.value = defaulttext;
    }
}

function quiz_submit(form_id, answer_id, correct_answer)
{
    answer = $('input:hidden[name=text]').val();
    if (correct_answer == answer) {
        alert('Correct!');
    }
    else {
        alert('Incorrect! It was ' + correct_answer);
    }
    return false;
}

var autoslideshow_interval;
var autoslideshow_images;
function autoslideshow(images)
{
    autoslideshow_images = images;

    autoslideshow_interval = setInterval(autoslideshow_update, 1700);
}

function autoslideshow_update()
{
    if (typeof autoslideshow_update.counter == 'undefined') {
        autoslideshow_update.counter = 0;
    }

    if (typeof autoslideshow_images[autoslideshow_update.counter] == 'undefined') {
        clearInterval(autoslideshow_interval);
    }
    else {
        document.getElementById('board_image').src = autoslideshow_images[autoslideshow_update.counter];
        //alert( "drawable/" + autoslideshow_images[autoslideshow_update.counter]);
    }

    autoslideshow_update.counter++;
}

function set_and_submit(value, correct)
{
    $('input:hidden[name=text]').val(value);
    if (correct) {
        alert('Correct!');
    }
    else {
        alert('Incorrect!');
    }
    $('#submit').click();
}
