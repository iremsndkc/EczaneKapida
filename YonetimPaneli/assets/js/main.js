//Onex 2 Main Page Scripts

$(document).ready(function(e) {
resize();

$(".popoverlay").click(function() {
	HidePopGallery();
});
});

$(window).resize(function() {
resize();
PopGalleryResize();
});

function resize() {
if ($('.leftmenu').size() > 0)
{$('.leftmenu').css('height',$(document).height()-114);
$('.rightcontent').css('width',$(document).width()-300);}
else
{$('.rightcontent').css('width',$(document).width()-50);}
	}

ONEX = {};

$(document).ready(function() {
    ONEX.Commutator.init();
});

//Commutator

(function() {
function Commutator() {
}

var klass = Commutator.prototype;
var self = Commutator;
ONEX.Commutator = Commutator;

self.init = function() {
    self.bindEvents();
};

self.bindEvents = function() {
    $(self.element).mousedown(function() {
        if ($(this).hasClass("off")) {
            $(this).removeClass("off").addClass("on");
			$('#'+$(this).attr("onex-id")).val("1");
        } else {
            $(this).addClass("off").removeClass("on");
			$('#'+$(this).attr("onex-id")).val("0");
        }
    });
};

// vars
self.element = ".commutator";
}());