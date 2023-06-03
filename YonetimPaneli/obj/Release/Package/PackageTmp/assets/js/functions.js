//Onex 2 General Function Scripts

function CenterElement(Elem) {
DWidth = $(document).width();
DHeight = $(document).height();
EWidth = $(Elem).width();
EHeight = $(Elem).height();
$(Elem).css('position','absolute');
$(Elem).css('top',((DHeight-EHeight)/2));
$(Elem).css('left',((DWidth-EWidth)/2));
}

function confirmDelete(delUrl) {
  if (confirm("Yçerik silinecektir?")) {
    document.location = delUrl;
  }
}

function PopGalleryResize()
{
$('.popgallery').css('width',$(window).width()-150);
$('.popgallery').css('left',75);
	}

function PopGallery()
{
$(document).scrollTop(0);
$('.popoverlay').fadeIn();
$('.popgrade').fadeIn();
$('.popgallery').slideDown();
$('body').css('overflow','hidden');
$('#popframe').attr('src','gallery.asp?m=i');
//Resize Gallery
PopGalleryResize();
	}

function PopGallery2()
{
$(document).scrollTop(0);
$('.popoverlay').fadeIn();
$('.popgrade').fadeIn();
$('.popgallery').slideDown();
$('body').css('overflow','hidden');
$('#popframe').attr('src','gallery.asp?m=i&f=2');
//Resize Gallery
PopGalleryResize();
}

function PopGallery3()
{
$(document).scrollTop(0);
$('.popoverlay').fadeIn();
$('.popgrade').fadeIn();
$('.popgallery').slideDown();
$('body').css('overflow','hidden');
$('#popframe').attr('src','gallery.asp?m=i&f=3');
//Resize Gallery
PopGalleryResize();
}

function HidePopGallery()
{
$('.popoverlay').fadeOut();
$('.popgrade').fadeOut();
$('.popgallery').slideUp();
$('body').css('overflow','auto');
}

function HidePopGalleryFrame()
{
$('.popoverlay', parent.document).fadeOut();
$('.popgrade', parent.document).fadeOut();
$('.popgallery', parent.document).slideUp();
$('body', parent.document).css('overflow','auto');
}

function PopImageSelect(image)
{
$('#popimage', parent.document).attr('src','../uimages/thumbs/'+image);
$('#coverimage', parent.document).val(image);
HidePopGalleryFrame();
	}

function PopImageSelect2(image)
{
$('#popimage2', parent.document).attr('src','../uimages/thumbs/'+image);
$('#coverimage2', parent.document).val(image);
HidePopGalleryFrame();
	}

function PopImageSelect3(image)
{
$('#popimage3', parent.document).attr('src','../uimages/thumbs/'+image);
$('#coverimage3', parent.document).val(image);
HidePopGalleryFrame();
	}

function passwordChanged() {
var strength = document.getElementById("strength");
var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
var enoughRegex = new RegExp("(?=.{6,}).*", "g");
var pwd = document.getElementById("password");
if (pwd.value.length==0) {
strength.innerHTML = '<div class="alert alert-danger">Þifre yazmalýsýnýz!</span>';
} else if (false == enoughRegex.test(pwd.value)) {
strength.innerHTML = '<div class="alert alert-danger">Çok kýsa bir þifre seçtiniz!</span>';
} else if (strongRegex.test(pwd.value)) {
strength.innerHTML = '<div class="alert alert-success">Güçlü bir þifre seçtiniz!</span>';
} else if (mediumRegex.test(pwd.value)) {
strength.innerHTML = '<div class="alert alert-info">Orta güçte bir þifre seçtiniz!</span>';
} else {
strength.innerHTML = '<div class="alert alert-danger">Çok zayýf bir þifre seçtiniz!</span>';
}
}

function Onex() {console.log("Onex V2.0");}

function passsamecheck(id1,id2)
{
if ($('#'+id1).val() == $('#'+id2).val())
{
	$('')
}
else
{return false;}
	}