
var timeoutHandle;
function countdown(minutes,status) {
    var seconds = 60;
    var mins = minutes
   
        function tick() {
            var counter = document.getElementById("mycounter");
            var current_minutes = mins - 1
            seconds--;
            counter.innerHTML =
            current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
            if (seconds == 0 && current_minutes == 0) {
                alertify.error("Times Up! ");

                //  countdown(1);
            }
            if (seconds > 0) {
                timeoutHandle = setTimeout(tick, 1000);
            } else {

                if (mins > 1) {

                    // countdown(mins-1);   never reach “00″ issue solved:Contributed by Victor Streithorst
                    setTimeout(function () { countdown(mins - 1); }, 1000);

                }
            }
        }
        tick();
    
   
   
}



