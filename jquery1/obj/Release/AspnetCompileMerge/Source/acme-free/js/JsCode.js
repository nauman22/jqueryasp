var NORMAL_FONTSIZE = '10pt';
var HIGHRES_FONTSIZE = '16pt';
function setFonSize(elm, fontsize) { }
function DrawPic(McqsId) {
    var Cnv_clear = document.getElementById('myCanvas');
    var Cntx_clear = Cnv_clear.getContext('2d');
    Cntx_clear.clearRect(0, 0, 900, 400);
    var $wrapper = document.getElementById(McqsId);
    var setFonSizeOfWrapper = setFonSize.bind(null, $wrapper);
    setFonSizeOfWrapper(HIGHRES_FONTSIZE);
    html2canvas($($wrapper), {
        onrendered: function (canvas) {
            var Cnv = document.getElementById('myCanvas');
            var Cntx = Cnv.getContext('2d');
            Cntx.drawImage(canvas, 0, 0);
            setFonSizeOfWrapper(NORMAL_FONTSIZE);
        }
    });
} function drawImage(opts) {
    if (!opts.canvas) { throw ("A canvas is required"); }
    if (!opts.image) { throw ("Image is required"); }
    var canvas = opts.canvas, context = canvas.getContext('2d'), image = opts.image, srcx = opts.srcx || 0, srcy = opts.srcy || 0, srcw = opts.srcw || image.naturalWidth, srch = opts.srch || image.naturalHeight, desx = opts.desx || srcx, desy = opts.desy || srcy, desw = opts.desw || srcw, desh = opts.desh || srch, auto = opts.auto, devicePixelRatio = window.devicePixelRatio || 1, backingStoreRatio = context.webkitBackingStorePixelRatio || context.mozBackingStorePixelRatio || context.msBackingStorePixelRatio || context.oBackingStorePixelRatio || context.backingStorePixelRatio || 1, ratio = devicePixelRatio / backingStoreRatio; if (typeof auto === 'undefined') { auto = true; } if (auto && devicePixelRatio !== backingStoreRatio) { var oldWidth = canvas.width; var oldHeight = canvas.height; canvas.width = oldWidth * ratio; canvas.height = oldHeight * ratio; canvas.style.width = oldWidth + 'px'; canvas.style.height = oldHeight + 'px'; context.scale(ratio, ratio); } context.drawImage(pic, srcx, srcy, srcw, srch, desx, desy, desw, desh);
} function updateURL(key, val) {
    var url = window.location.href;
    var reExp = new RegExp("[\?|\&]" + key + "=[0-9a-zA-Z\_\+\-\|\.\,\;]*");
    if (reExp.test(url)) {
        var reExp = new RegExp("[\?&]" + key + "=([^&#]*)");
        var delimiter = reExp.exec(url)[0].charAt(0);
        url = url.replace(reExp, delimiter + key + "=" + val);
    } else {
        var newParam = key + "=" + val;
        if (!url.indexOf('?')) { url += '?'; }
        if (url.indexOf('#') > -1) {
            var urlparts = url.split('#');
            url = urlparts[0] + "&" + newParam + (urlparts[1] ? "#" + urlparts[1] : '');
        } else { url += "&" + newParam; }
    } window.history.pushState(null, document.title, url);
} function UploadPic(divId, testName, TotalQuestions, btnId)
{
    oldurl = window.location.pathname;
    Router.navigate();
    var div = document.querySelector("#" + divId); html2canvas($(div), { width: 526, height: 275 }).then(function (canvas) {
        theCanvas = canvas; document.body.appendChild(canvas);
        var data = canvas.toDataURL("image/png");
        data = data.replace(/^data:image\/(png|jpg);base64,/, "");
        $.ajax({
            timeout: 90000,
            type: 'POST',
            url: 'default.aspx/UploadPic',
            data: '{ "imageData" : "' + data + '" ,"TestName" : "' + testName + '"}',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                var picName_ser = msg.d;
                var pic_paths = "http://www.freemcqs.com/facebook/" + picName_ser; $('#testimg').html('<img src="Facebook/' + picName_ser + '" height="275" width="526">');
                document.body.removeChild(canvas);
                FB.ui({ method: 'share', app_id: '1652596581731791', name: testName, href: 'http://www.freemcqs.com', link: 'http://www.freemcqs.com/', picture: pic_paths, caption: 'For more Free Mcqs Please visit www.Freemcqs.Com', description: 'Total MCQS of this ' + testName + ' is aproximately ' + TotalQuestions, message: '' });
                Router.navigate(oldurl);
            }
        });
    });
}