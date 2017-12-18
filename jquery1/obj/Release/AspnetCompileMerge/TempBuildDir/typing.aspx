<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="typing.aspx.cs" Inherits="jquery1.typing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="acme-free/js/jquery-1.12.3.min.js"></script>

    <link href="acme-free/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="acme-free/css/bootstrap.min.css" rel="stylesheet" />
    <script src="acme-free/js/html2canvas.js"></script>
    <script src="acme-free/js/bootstrap.min.js"></script>
    <link href="DataTables_1/datatables.css" rel="stylesheet" />
    <script src="DataTables_1/datatables.js"></script>

    <script type='text/javascript'>

        var totaltesttimeduration = 0;
        var totaluserseltime = 0;
        var totallen = 0;
        var i = 0;
        var word1 = [];
        var word2 = "";
        var newHTML = "";
        var newHTML2 = "";
        var prepara = "";
        var alltypepara = $("#prepara").text();
        var mynew = [];
        var count;
        var totalchars = 0;
        var totalcharscorrect = 0;
        var totalcharsincorrect = 0;
        var mytotalparagraphs = 1;
        var mytotalwordswrittencount = 0;
        var userdeclaredtime = "";
        var Splitpara = new Array();
        var find = ',';
        var comma = new RegExp(find, 'g');
        var doublespace = new RegExp('  ', 'g');
        var rank = "";
        var rankName = "";
        var grosssp = "";
        var netspeed = "";
        var accuracy = "";
        grosssp = grosssp[0];
        netspeed = netspeed[0];
        accuracy = accuracy[0];
        function hideall() {
            $("#divTypingSelectTest").hide();
            $("#divTypingTest").hide();
            $("#divTypingTestLists").hide();
            $("#divprinttest").hide();
        }
        var filename_userpic = "";
        var filetext_userpic = "";
        function resizeBase64Img(base64, width, height) {
            //debugger
            var canvas = document.createElement("canvas");
            canvas.width = width;
            canvas.height = height;
            var context = canvas.getContext("2d");
            var deferred = $.Deferred();
            $("#myimg").attr("src", base64).load(function () {
                context.scale(width / this.width, height / this.height);
                context.drawImage(this, 0, 0);
                deferred.resolve($("<img/>").attr("src", canvas.toDataURL()));
            });
            return deferred.promise();
        }
        function readFile(file) {
            // //debugger;

            var ext = $('#uploadtypingtest_userpic').val().split('.').pop().toLowerCase();
            if ($.inArray(ext, ['jpg', 'jpeg']) == -1) {
                alert('This type of file is not Allowed! Alloweds are  { jpg, jpeg }');
                return true;
            }



            file = file.files[0];
            filename_userpic = file.name;


            var reader = new FileReader();
            reader.onload = readSuccess;
            function readSuccess(evt) {
                // var field = document.getElementById('main');
                filetext_userpic = evt.target.result;
                $("#myimg").attr("src", filetext_userpic);

                //console.log(filetext_userpic);

            };
            reader.readAsDataURL(file);
        }

        var wordsrangtosplit = 0;
        var mytable = "";
        $(document).ready(function () {

            // testing lab code


            // End testing lab code




            var txt = "";

            $.ajax({

                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "typing.aspx/userstable",
                data: "",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    var rank = "";
                    var rankName = "";
                    var date = new Date();

                    var options = {
                        weekday: "long", year: "numeric", month: "short",
                        day: "numeric", hour: "2-digit", minute: "2-digit"
                    };
                    txt += '<tbody>';
                    $.each(Result.d, function (key, value) {
                        // console.log('value  ' + value);
                        if (value.NetSpeed >= 1 && value.NetSpeed <= 10) {
                            rank = "acme-free/Medals/Fail.jpg";
                            rankName = "F";

                        }
                        else
                            if (value.NetSpeed >= 11 && value.NetSpeed <= 15) {
                                rank = "acme-free/Medals/goodtry.jpg";
                                rankName = "E";
                            }
                            else
                                if (value.NetSpeed >= 16 && value.NetSpeed <= 20) {
                                    rank = "acme-free/Medals/goodtry.jpg";
                                    rankName = "D";
                                }
                                else if (value.NetSpeed >= 21 && value.NetSpeed <= 25) {
                                    rank = "acme-free/Medals/iron.jpg";
                                    rankName = "C-";

                                }
                                else if (value.NetSpeed >= 26 && value.NetSpeed <= 30) {
                                    rank = "acme-free/Medals/tin1.JPG";
                                    rankName = "C";
                                }
                                else if (value.NetSpeed >= 31 && value.NetSpeed <= 35) {
                                    rank = "acme-free/Medals/copper.jpg";
                                    rankName = "C+";
                                }
                                else if (value.NetSpeed >= 36 && value.NetSpeed <= 40) {
                                    rank = "acme-free/Medals/bronze.png";
                                    rankName = "B-";
                                }
                                else if (value.NetSpeed >= 41 && value.NetSpeed <= 45) {
                                    rank = "acme-free/Medals/bronze.png";
                                    rankName = "B";
                                }
                                else if (value.NetSpeed >= 46 && value.NetSpeed <= 50) {
                                    rank = "acme-free/Medals/silver2.jpg";
                                    rankName = "B+";
                                }
                                else if (value.NetSpeed >= 51 && value.NetSpeed <= 55) {
                                    rank = "acme-free/Medals/Gold1.jpg";
                                    rankName = "A-";
                                }
                                else if (value.NetSpeed >= 56 && value.NetSpeed <= 60) {
                                    rank = "acme-free/Medals/best.jpg";
                                    rankName = "A";
                                }
                                else if (value.NetSpeed >= 61) {
                                    rank = "acme-free/Medals/Trophy.jpg";
                                    rankName = "A+";
                                }
                        // var orderdate = new Date(parseInt(value.TestTakenDateTime.replace("/Date(", "").replace(")/", ""), 10));

                        // orderdate.toString('MM-dd-yyyy');
                        var userpic = "";
                        if (value.ispic == 0) {
                            userpic = "users-md.png";
                        }
                        else {
                            userpic = value.Id + '.jpg';
                        }

                        // date = (value.TestTakenDateTime);
                        //  console.log('rank ' + rank);
                        txt += "<tr role='row'>" +
                            "<td>" + value.Id + "</td>" +
                            " <td class='sorting_1'><img src='acme-free/userpics/" + userpic + "' width='44' height='44' ></td>" +
                           " <td>" + value.Name + "</td>" +
                           " <td>" + value.NetSpeed + "WPM</td>" +
                            "<td>" + value.TimeTaken + "</td>" +
                            "<td>" + value.Accuracy + "%</td>" +
                            "<td><img src='" + rank + "' width='44' height='50'></td>" +
                            "<td><button id='btnresultcard' class='btn btn-link' type='button' >Certificate</button></td>" +
                            "<td>" + value.NetSpeed + "</td>"
                        "</tr>"
                    });
                    txt += '</tbody>';
                    $("#tbltypingusers").append(txt);

                    mytable = $("#tbltypingusers").DataTable({
                        "pageLength": 5,
                        "columnDefs": [
                                    {
                                        "targets": [8],
                                        "visible": false,
                                        "searchable": false
                                    }],
                        "createdRow": function (row, data, index) {

                            if (data[8] <= 20) {

                                $('td', row).eq(3).addClass('highlightred');
                            }
                            else if (data[8] >= 20 && data[8] <= 40) {

                                $('td', row).eq(3).addClass('highlightyello');
                            }
                            else if (data[8] > 40) {

                                $('td', row).eq(3).addClass('highlightredgreen');
                            }
                        }
                    });
                    //   mytable.fnPageChange( 'last' );
                    //alertify.success("Loaded Successfully");
                },
                error: function (Result) {
                    //alertify.error("There is an Error occoured. Please try again later.");
                }
            });

            $("#spell-here").focus();
            hideall();
            $("#divTypingSelectTest").show();
            // $("#divTypingTestLists").show();
            //$("#uploadtypingtest_userpic").click(function () {
            File.prototype.convertToBase64 = function (callback) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    callback(e.target.result)
                };
                reader.onerror = function (e) {
                    callback(null);
                };
                reader.readAsDataURL(this);
            };


            String.prototype.toHHMMSS = function () {
                var sec_num = parseInt(this, 10); // don't forget the second param
                var hours = Math.floor(sec_num / 3600);
                var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
                var seconds = sec_num - (hours * 3600) - (minutes * 60);

                if (hours < 10) { hours = "0" + hours; }
                if (minutes < 10) { minutes = "0" + minutes; }
                if (seconds < 10) { seconds = "0" + seconds; }
                // return hours + ':' + minutes + ':' + seconds;
                return minutes + ':' + seconds;
            }



            var TypingTest = {

                // Track the characters for this test
                Characters: {
                    Total: 0,
                    Correct: 0,
                    Incorrect: 0
                },
                // Define properties about the timer
                Timer: {

                    // Store the instance for this timer
                    TimerInstance: undefined,
                    // Start the timer
                    Start: function () {

                        ////debugger;
                        // Start a timer that ticks every 0.1s
                        TypingTest.Timer.TimerInstance = setInterval(function () {
                            TypingTest.Timer.Duration++;
                            // Update properties

                            totalchars = TypingTest.Characters.Total;
                            totalcharscorrect = TypingTest.Characters.Correct;
                            totalcharsincorrect = TypingTest.Characters.Incorrect;

                            $("#accuracy").html(((TypingTest.Characters.Correct / TypingTest.Characters.Total) * 100).toFixed(0) + ' %');
                            // Calculate total words
                            var words = Splitpara.length;
                            // Divide words by the number of minutes that have elapsed
                            var gwpm = ((((TypingTest.Characters.Total * 5) / ((TypingTest.Timer.Duration))) * 10));
                            //console.log('gwpm  ' + gwpm);
                            $("#Grwpm").html(gwpm.toFixed(0) + ' WPM');
                            $("#wpm").html((parseInt(gwpm) - parseInt(TypingTest.Characters.Incorrect * 5 / ((TypingTest.Timer.Duration)) * 10)).toFixed(0) + ' WPM');

                            userdeclaredtime = userdeclaredtime - 1;
                            //console.log('userdeclaredtime  '+ userdeclaredtime)
                            var userprogresbartime = (TypingTest.Timer.Duration / totaluserseltime) * 100;
                            //console.log('userprogresbartime = ' + userprogresbartime + '   totaluserseltime = ' + totaluserseltime + '  userdeclaredtime = ' + userdeclaredtime);
                            $('.progress-bar').css('width', userprogresbartime.toFixed(0) + '%').attr('aria-valuenow', userprogresbartime.toFixed(0));
                            $('.progress-bar').text(userprogresbartime.toFixed(0) + '%')
                            //console.log(finalTime)
                            //alert(finalTime)
                            if (userdeclaredtime == 0) {
                                totaltesttimeduration = TypingTest.Timer.Duration;
                                $("#totaltimeconsumed").html((totaltesttimeduration.toString().toHHMMSS()));
                                var finalTime = "Times Up!";
                                // $('.timer').html(finalTime);
                                $(".timer").html("00:00");
                                $('.progress-bar').text('100%')
                                TypingTest.Timer.Stop();
                                clearInterval(TypingTest.Timer.TimerInstance);
                                TimerInstance: undefined;

                                $("#spell-here").removeAttr('contenteditable').blur();
                                alert("Exercise Completed. \n \n Click to Finish Button to see the result!");

                            }
                            else {

                                var finalTime = userdeclaredtime.toString().toHHMMSS();

                                // $('.timer').html(finalTime);
                                $("#totaltimeconsumed").html(TypingTest.Timer.Duration.toString().toHHMMSS());
                                $(".timer").html(finalTime);
                            }



                        }, 1000);
                    },
                    // A function to stop the timer
                    Stop: function () {
                        // Stop the timer
                        clearInterval(TypingTest.Timer.TimerInstance);
                        TimerInstance: undefined;
                        // modal.style.display = "block";

                    },
                    // Track the duration
                    Duration: 0

                }
            }

            function str_pad_left(string, pad, length) {
                return (new Array(length + 1).join(pad) + string).slice(-length);
            }

            $(function () {
                // When the user starts typing in the spell here area, start the timer

                //TimerInstance:undefined;
                totallen = 0;

                i = 0;
                word1 = [];
                word2 = "";
                newHTML = "";
                newHTML2 = "";
                prepara = "";
                alltypepara = $("#prepara").text();
                mynew = [];
                count;
                mytotalparagraphs = 1;
                mytotalwordswrittencount = 0;
                // var totals = getTextThatFits($("#prepara").text(), 600, 11, 'sans-serif', 'normal')
                //  console.log('totals  ' + totals);
                //  alert(alltypepara)
                //return true;
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1; //January is 0!

                var yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                var today = yyyy + '/' + mm + '/' + dd;

                var deadline = new Date(Date.parse(new Date()) + 100220);

                // document.getElementById("DATE").value = today;
                $("#spell-here").keyup(function (e) {
                    // If the timer hasn't started, start it
                    mynew = [];

                    var totalchpressed = TypingTest.Characters.Total + 1;
                    if (TypingTest.Timer.TimerInstance == undefined) {


                        TypingTest.Timer.Start();

                        //  circularCountDown;
                        // spinnerExamples();
                    }
                    if (e.keyCode == 32) {

                        mytotalwordswrittencount++;
                        // var totals = getTextThatFits($("#prepara").text(), 600, 12, 'sans-serif', 'normal')
                        //  console.log('totals  ' + totals);

                        //  console.log('prepara lenght ' + $("#mydata_para").text().length)


                        // Check if the character is correct based on position

                        var wordsp = $(this).text().trim().split(/\s+/);
                        if (wordsp[i] != "") {
                            // When each key is pressed, increment the totals
                            TypingTest.Characters.Total++;

                            //console.log('hidden word length ' + $('#word-to-spell').val().length);
                            //console.log('wordsp ' + wordsp.replace(/\uFFFD/g, ''));
                            word1.push(wordsp[i]);
                            word2 = Splitpara[mytotalparagraphs].replace(/\s\s+/g, ' ').replace(doublespace, '').replace(/[\r\n]+/g, " ").replace(/\uFFFD/g, '').trim().split(" ", Splitpara[mytotalparagraphs].length)
                            //console.log('word2  = ' + word2.replace(/\uFFFD/g, ''));
                            //console.log('   word1[i] = ' + word1[i] + '   word2[i] = ' + word2[i] + '    word1[i]length = ' + word1[i].length + '    word2[i].length  ' + word2[i].length);
                            // $.each(word1[i], function (index, value) {

                            //console.log('word length  = '+$(this).text().length+' i value = '+ i+'  word1[i] in loop = ' + word1[i] + '  word2[i] = ' + word2[i]);
                            if (word1[i] == word2[i]) {
                                TypingTest.Characters.Correct++;
                                newHTML += "<span class='correct'>" + word1[i] + "</span><span>&nbsp;</span>";
                                newHTML2 += "<span>" + word2 + "<u>" + word2[i] + " </u>  </span>";
                                i++;

                            }

                            else {
                                TypingTest.Characters.Incorrect++;
                                newHTML += "<span class='wrong'><u>" + word1[i] + " </u>  </span><span>&nbsp;</span>";
                                newHTML2 += "<span>" + word2 + "<u>" + word2[i] + " </u>  </span>";

                                i++;

                            }

                            $.each(word2, function (index, value) {
                                //  //debugger;
                                if (index == word1.length) {
                                    mynew.push('<span ><u style="color:blue;">' + value + '</u></span><span>&nbsp;</span>');
                                }
                                //else {
                                //    mynew.push('<span   >' + value + '</span><span>&nbsp;</span>');
                                //}
                                if (index < word1.length) {
                                    mynew.push('<span class="written"><u>' + value + '</u></span><span>&nbsp;</span>');
                                }
                                if (index > word1.length) {

                                    mynew.push('<span>' + value + '</span><span>&nbsp;</span>');
                                }




                            });
                            //}
                            $('#prepara').html(mynew.join(" ")).removeClass('myfristletter');
                            // $('#prepara').replaceWith("<div>" + $(this).text() + "</div>");
                            console.log('newHTML  ' + newHTML.replace(/\uFFFD/g, ''))
                            $("#spell-here").html(newHTML);
                            // $("#prepara").html(newHTML2);
                            var child = $(this).children();
                            var range = document.createRange();
                            var sel = window.getSelection();
                            range.setStart(child[child.length - 1], 1);
                            range.collapse(true);
                            sel.removeAllRanges();
                            sel.addRange(range);
                            $(this)[0].focus();
                            // Check if the word has been spelled
                            console.log('$(this).val()  = ' + $(this).text().length + '  and  $("#word-to-spell").val()   = ' + $("#word-to-spell").val().length);
                            if (mytotalwordswrittencount >= word2.length) {
                                // End the timer
                                mytotalparagraphs = mytotalparagraphs + 1;
                                //  console.log('mytotalparagraphs  ' + mytotalparagraphs.replace(/\uFFFD/g, ''))
                                if (mytotalparagraphs <= Splitpara[mytotalparagraphs].length) {
                                    textfinal = Splitpara[mytotalparagraphs].replace(comma, '').replace(/\s\s+/g, ' ').replace(doublespace, '').replace(/[\r\n]+/g, " ").replace(/'u0092'/g, "'").replace(/\uFFFD/g, '').replace(/`/g, '"');
                                    // var textfinal = Splitpara[mytotalparagraphs].replace(comma, '').replace(/\s\s+/g, ' ').replace(doublespace, '');
                                    $("#prepara").html(textfinal.trim()).addClass('myfristletter');
                                    $("#word-to-spell").val(textfinal.trim());

                                    $("#spell-here").text("");
                                    word1 = [];
                                    i = 0;
                                    newHTML = "";
                                    newHTML2 = "";
                                    mytotalwordswrittencount = 0;
                                }
                                else {
                                    totaltesttimeduration = TypingTest.Timer.Duration;
                                    TypingTest.Timer.Stop();

                                    alert("Exercise Completed. \n \n Click to Finish Button to see the result!")

                                    // modal.style.display = "block";
                                }
                                console.log('Matched and should stop the timer.')
                                //TypingTest.Timer.Stop();
                                //  $('.timer').circularCountDown({ stop:true});
                            }
                        }
                    }
                })

            });
            $("#tbltypingusers").on("click", '#btnresultcard ', function (event) {

                // alert('I am detail :)');
                // var id = myTable.data(this)[0];
                //var result = confirm("Are you sure to Clear this Objection ?");
                // if (result) {
                var tr = $(this).closest('tr');
                var row = mytable.row(tr);
                var UserId = mytable.row(row[0][0]).data()[0];
                $("#txtUserId").val(UserId);
                document.getElementById('<%= btnPrintTypingcert.ClientID %>').click();
                // $("#btnPrintTypingcert").click();
                // console.log("row  " + row + "AdminId   " + AdminId);
                // showmcqs(AdminId)




                // Scroll_top();
                //  hide_all();
                // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
                // showPractice(Id);
                // $("#mainheader").hide();
                //  $("#testheader").show();
                // goToByScroll();
                // $(window).scrollTop($('#tblLoadMcqsAllQuestion').offset().top);
                //$('#btnShowResultdiv').show(200);

                //displayUserInfo(id);
            });

            $(function () {
                $("#upload_link").on('click', function (e) {
                    e.preventDefault();
                    $("#uploadtypingtest:hidden").trigger('click');

                });



                var filetext = "";
                var filename = "";
                var fileInput = document.getElementById('uploadtypingtest');
                fileInput.addEventListener('change', function (e) {
                    // getData();
                    var file = fileInput.files[0];
                    //debugger;
                    var textType = /text.*/;
                    console.log(file.size);
                    if (file.size > 3000) {
                        alert("File size is too large. Only less than 3KB size is allowed.");
                        return true;
                    }
                    if (file.type.match(textType)) {
                        var reader = new FileReader();
                        filename = file.name.toString();
                        reader.onload = function (e) {
                            filetext = reader.result;//readAsText(file, 'ISO-8859-1');
                            // console.log("Uploaded Paragraph Text = " + filetext);
                            // alert('filename = ' + filename + '    filetext =   ' + filetext)
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                complete: function () { },
                                beforeSend: function () { },
                                timeout: 90000,
                                url: "typing.aspx/UploadTextFile",
                                data: "{'filename':'" + filename + "','text':'" + filetext + "'}",
                                timeout: 90000,
                                dataType: "json",
                                success: function (data) {
                                    var obj = data.d;
                                    //itotal = data.d;
                                    // alertify.success("Updated Successfully ")
                                    // alert('data.d =  ' + data.d)
                                    if (obj == '0') {
                                        alert('Not saved Successfully')
                                        // $('#lblQuestionComplete').html('Error in Updating Question with All Options...');
                                        // alertify.error('Error in Updating Question with All Options...');
                                        //SaveStatus = 0;

                                    }
                                    else {

                                        $("#ddltypingtext").prepend("<option value='' selected='selected'>" + obj + "</option>");
                                        alert("congrats! Saved Successfully")
                                    }

                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert("Sorry Your File can not be added due to some error try another file.");
                                }
                                //error: function (jqXHR, exception) {
                                //    var msg = '';
                                //    if (jqXHR.status === 0) {
                                //        msg = 'Not connect.\n Verify Network.';
                                //    } else if (jqXHR.status == 404) {
                                //        msg = 'Requested page not found. [404]';
                                //    } else if (jqXHR.status == 500) {
                                //        msg = 'Internal Server Error [500].';
                                //    } else if (exception === 'parsererror') {
                                //        msg = 'Requested JSON parse failed.';
                                //    } else if (exception === 'timeout') {
                                //        msg = 'Time out error.';
                                //    } else if (exception === 'abort') {
                                //        msg = 'Ajax request aborted.';
                                //    } else {
                                //        msg = 'Uncaught Error.\n' + jqXHR.responseText;
                                //    }
                                //    $('#lblQuestionComplete').html(msg);
                                //}
                            })

                        }
                        reader.readAsText(file);

                        //filetext = reader.result;
                        //  filetext = reader.result;
                    } else {
                        console.log("File not supported!")
                        return true;
                    }

                    //return true;



                });


            });


            $("#btnStartTypingTest").click(function () {

                var skillsSelect = document.getElementById("ddltypingtext");
                var selectedText = skillsSelect.options[skillsSelect.selectedIndex].text;
                var filename = selectedText //$("#ddltypingtext").sele.text();
                var time = $("#typingtime").val();
                if (filename == "" || time == "") {
                    alert("Please Select Test and Time First");
                    return true;
                }
                var mytime = time.toLowerCase();
                if (mytime == "free") {
                    time = 1000000;
                }
                else {
                    mytime = time.match(/\d/g);
                    time = mytime.join("");
                }
                var myte = time * 60;
                var finalTime = myte.toString().toHHMMSS();
                $(".timer").html(finalTime);
                userdeclaredtime = time * 60;
                //userdeclaredtime = userdeclaredtime - 1;
                totaluserseltime = userdeclaredtime - 1;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    complete: function () { },
                    beforeSend: function () { },
                    timeout: 90000,
                    url: "typing.aspx/Loadbasics",
                    data: "{'filename':'" + filename + "'}",
                    timeout: 90000, dataType: "json",
                    success: function (data) {
                        var obj = data.d;
                        //itotal = data.d;
                        // alertify.success("Updated Successfully ")
                        // alert('data.d =  ' + data.d)
                        if (obj == '') {
                            alert('No text found !')
                            // $('#lblQuestionComplete').html('Error in Updating Question with All Options...');
                            // alertify.error('Error in Updating Question with All Options...');
                            //SaveStatus = 0;

                        }
                        else {
                            $("#myselParabyuser").val(obj);
                            var me = obj;
                            //alert(me)

                            var alternativetext = 'The word "astronaut" derives from the Greek words meaning "star" and "sailor." These men and women -- Alan Shepherd, John Glenn, Jr., Sally Ride, to name a few -- conjure up images of bravery and adventure. They are modern heroes, helping humanity reach for the stars. ' +

                            ' When the space program began in 1959, there were only seven such people in the entire country. They all were then -- or had been in the past -- in the armed forces. Most of them were test pilots, used to the dangers that came from "pushing the envelope." That was only 36 years ago, and since then much has changed. ' +

                            ' Today the Americans who make up the shuttle crews are comprised of every race, creed, color, and gender. As of May 2, 1993, 180 men and 21 women astronauts were Caucasian, six men and one woman were African-American, three men and one woman were Hispanic, and two men were of Asian descent. ' +

                            ' NASA, the National Aeronautics and Space Administration, chooses its astronauts from an increasingly diverse pool of applicants that "looks like America." Thousands of applications come in from all over the world; from these, approximately 100 men and women are chosen for an intensive astronaut candidate training program every two years. "I cannot imagine a better career.' + " I've done more than I could ever have imagined. I'm thankful that I've been at the right place at the right time," + " says astronaut Kenneth S. Reightler. " +

                            ' The training is demanding, but the study time involved is no longer than that of any other professional career requiring graduate/post-graduate study. If becoming an astronaut is a dream, held long and steadfast, then this labor will be one of love. ' +

                             "    The preparation for becoming an astronaut actually begins in elementary school. " + "It is here that the foundations are laid down and then built upon," + " comments Colonel Charlie Bolden, Deputy Commandant of Midshipmen at the U.S. Naval Academy." + "Start with the basics and get them down first ... you can't do anything without math and science." + " At this level, students should read everything they can get their hands on about astronauts and space in general. Later, once they have found a specific field of interest, they can begin to focus on that. " +

                             "    But there's more than book learning involved. Other skills Bolden feels are integral to becoming an astronaut are: being able to work as a team player; understanding and appreciating your ethnic, cultural, and American history; and maintaining a grasp on current events. " +

                             "Bolden does not hold the opinion that America's young people are less equipped than their foreign counterparts. " + "I listen to people say that American students can't do this and can't do that. I don't buy into or accept that at all. Kids are just as sharp as when I came up. It's just motivation that may be lacking," + " Bolden said. " +

                             'It is also interesting to note that out of 195 former and present astronauts, 123 (64%) have taken part in some form of scouting. Scouting develops a sense of discipline, as well as particular skills. Both are crucial to becoming part of the astronaut team.' +

                            ' Once students reach high school, it is particularly important that they earn the best possible grades as well as high standardized test scores (SAT and/or ACT). NASA looks for the best and the brightest, so it makes sense that they would look at how well students apply themselves to their studies. At this point, too, students should begin to think about a specific direction of study, such as engineering, biological or physical science, or mathematics. This will help them direct their education once they get to college. ' +

                            " Again, though, books are only part of the process. It's a good idea to look for out-of-school opportunities like internships or apprenticeships, summer programs, and fieldwork, to help balance textbook learning. After all, going into space is a real-world -- not a virtual -- experience; the more experience you bring to it, the better you'll be able to deal with the demands of the job. Internships are also a good way of finding out if your career choice is the right one for you. Many students, when faced with the realities of a particular field, decide it's not what they wanted, after all. It's better to decide early on that this is the case, before you devote a lot of time and effort to something you don't enjoy. " +

                            " But choose your activities wisely. " + "If you do things thinking that, 'This will look good on a resume, or 'I'm not going to like it but it'll help me get selected someday,' you will do yourself a disservice. You're not going to do as well as you would at something in which you're interested," + 'said Reightler.';
                            ////debugger;

                            if ($(window).width() < 360) {
                                wordsrangtosplit = 10;
                                console.log('Less than ' + $(window).width());
                            }
                            else if ($(window).width() < 460) {
                                wordsrangtosplit = 20;
                                console.log('Less than ' + $(window).width());
                            }
                            else if ($(window).width() < 560) {
                                wordsrangtosplit = 30;
                                console.log('Less than ' + $(window).width());
                            }
                            else if ($(window).width() < 660) {
                                wordsrangtosplit = 40;
                                console.log('Less than ' + $(window).width());
                            }
                            else if ($(window).width() < 760) {
                                wordsrangtosplit = 50;
                                console.log('Less than ' + $(window).width());
                            }
                            else if ($(window).width() < 860) {
                                wordsrangtosplit = 60;
                                console.log('Less than ' + $(window).width());
                            }
                            else if ($(window).width() <= 960) {
                                wordsrangtosplit = 70;
                                console.log('Less than ' + $(window).width());
                            }
                            else if ($(window).width() > 960) {
                                wordsrangtosplit = 80;
                                console.log('Less than ' + $(window).width());
                            }


                            var myparatext = me;
                            if (me.length <= 6) {
                                myparatext = alternativetext;
                            }



                            var wordsSplit = myparatext.split(' ');
                            wordsSplit = wordsSplit;
                            var count = wordsSplit.length;
                            var TotalSplitedparas = 0;
                            console.log('count  = ' + count);


                            var totalpararequired = count / wordsrangtosplit;
                            totalpararequired = totalpararequired.toFixed(0);

                            if (count > wordsrangtosplit) {
                                // var ci = 0;
                                var k = 1;
                                var lent = wordsrangtosplit;
                                Splitpara[k] = "";
                                // for (k = 1; k <= totalpararequired; k++) {
                                // //debugger;
                                for (i = 0; i < count ; i++) {
                                    //if (str[str.length-1] === ".")
                                    //if (i == 0)
                                    //{
                                    //    Splitpara[k] = 
                                    //}
                                    if (i > lent) {
                                        k++;
                                        Splitpara[k] = "";
                                        lent = lent + wordsrangtosplit;
                                    }
                                    if (i == lent) {
                                        if (wordsSplit[i][wordsSplit[i].length - 1] == ".") {
                                            Splitpara[k] += "";
                                            wordsrangtosplit = wordsrangtosplit - 1;
                                        }
                                        else {
                                            Splitpara[k] += ' ' + wordsSplit[i];
                                        }

                                    }
                                    else {
                                        Splitpara[k] += ' ' + wordsSplit[i];
                                    }

                                    // ci = wordsrangtosplit;

                                }

                                //   i = wordsrangtosplit;
                                //  wordsrangtosplit 
                                //count = count - totalpararequired;

                                // }
                            }
                            else {
                                Splitpara = myparatext;
                            }

                            // str = str.replace(re, '');
                            for (i = 1; i <= totalpararequired; i++) {

                                console.log('Paragraph ' + i + '  = ' + Splitpara[i].replace(/\uFFFD/g, ''));
                            }
                            totallen = 0;
                            i = 0;
                            word1 = [];
                            word2 = "";
                            newHTML = "";
                            newHTML2 = "";
                            prepara = "";
                            alltypepara = $("#prepara").text();
                            mynew = [];
                            count;
                            mytotalparagraphs = 1;
                            mytotalwordswrittencount = 0;
                            $("#prepara").text("");
                            $("#word-to-spell").val("");
                            $("#spell-here").text("");
                            var textfinal = Splitpara[1].replace(comma, '').replace(/\s\s+/g, ' ').replace(doublespace, '').replace(/[\r\n]+/g, " ").replace(/\u0092+/g, "'").replace(/\uFFFD/g, '').replace(/`/g, '"');
                            $("#prepara").html(textfinal.trim()).addClass('myfristletter');
                            $("#word-to-spell").val(textfinal.trim());
                            hideall();
                            $("#divTypingTest").show();
                            $(".editable").focus();




                        }

                    },
                    error: function (jqXHR, exception) {
                        var msg = '';
                        if (jqXHR.status === 0) {
                            msg = 'Not connect.\n Verify Network.';
                        } else if (jqXHR.status == 404) {
                            msg = 'Requested page not found. [404]';
                        } else if (jqXHR.status == 500) {
                            msg = 'Internal Server Error [500].';
                        } else if (exception === 'parsererror') {
                            msg = 'Requested JSON parse failed.';
                        } else if (exception === 'timeout') {
                            msg = 'Time out error.';
                        } else if (exception === 'abort') {
                            msg = 'Ajax request aborted.';
                        } else {
                            msg = 'Uncaught Error.\n' + jqXHR.responseText;
                        }
                        $('#lblQuestionComplete').html(msg);
                    }
                })
            })
            $("#btntypingtestCancel").click(function () {
                var result = confirm("Are you sure to Cancel this test ?");
                if (result) {
                    $("#btntypingtestFinish").click();
                    //TypingTest.Timer.Stop();
                    //TypingTest.Timer.TimerInstance = clearInterval(TypingTest.Timer.TimerInstance);
                    //TypingTest.Timer.Duration = 0;
                    //$('.progress-bar').css('width',  + '0%').attr('aria-valuenow', 0);
                    //$('.progress-bar').text('0%')
                    //$("#spinner1").html("0");
                    //hideall();
                    //$("#spell-here").text("");
                    //totallen = 0;
                    //i = 0;
                    //word1 = [];
                    //word2 = "";
                    //newHTML = "";
                    //newHTML2 = "";
                    //prepara = "";
                    //alltypepara = $("#prepara").text();
                    //mynew = [];
                    //count;
                    //mytotalparagraphs = 1;
                    //mytotalwordswrittencount = 0;
                    //mytotalwordswrittencount = 0;

                    //$("#prepara").text("");
                    //$("#word-to-spell").val("");
                    //$("#spell-here").text("");

                    //$("#divTypingSelectTest").show();
                }
            })
          

            var username = "";
            var time1 = "";
            var time2 = "";
            var totTime = "";
            $(".modal-footer button").on('click', function () {
                var userName = $(".modal #txtusername").val();
                if (userName == "")
                {
                    userName = "Anonymous";
                }

                var skillsSelect = document.getElementById("ddltypingtext");
                var selectedText = skillsSelect.options[skillsSelect.selectedIndex].text;



                $.ajax({
                    type: "POST",
                    url: "typing.aspx/UploadUserPicFiles",
                    contentType: 'application/json; charset=utf-8',
                    complete: function () { },
                    beforeSend: function () { },
                    timeout: 90000, //
                    data: "{'totalchars':'" + totalchars + "','totalcharscorrect':'" + totalcharscorrect + "','GrossSpeed':'" + grosssp + "','NetSpeed':'" + netspeed + "','Accuracy':'" + accuracy + "','username':'" + userName + "','TestName':'" + selectedText + "','userFinishTime':'" + time1 + "','totaluserdeclaredtime':'" + totTime + "','totalcharsincorrect':'" + totalcharsincorrect + "'}", //,'filename':'" + filename_userpic + "','text':'" + filetext_userpic + "'
                    timeout: 90000,
                    dataType: "json",
                    success: function (data) {

                        //$("#lbltypingRank").val(rankName);
                        var date = new Date();
                        var options = {
                            weekday: "long", year: "numeric", month: "short",
                            day: "numeric", hour: "2-digit", minute: "2-digit"
                        };


                        var mypicpath = "";
                        //  console.log("filename_userpic  " + filename_userpic); 
                        // if (filename_userpic == "") {
                        mypicpath = "users-md.png";
                        //}
                        //else {
                        //    mypicpath = data.d;
                        //}

                        // if (data.d == "users-md.png")
                        // {

                        //}
                        //  else {
                        var ids = data.d.match(/\d+/);
                        //   }


                        var totals = mytable.rows().count();
                        totals = totals++;
                        // console.log('total entries = ' + mytable.rows().count());
                        // console.log("userid " + ids[0]);
                        $("#txtUserId").val(ids[0]);
                        $("#divprinttest").show();
                        $("#divTypingTestLists").hide();
                        $("<tr role='row'><td>" + totals + "</td><td class='sorting_1'><img src='acme-free/userpics/" + mypicpath + "' width='44' height='44' onError='this.onerror=null;this.src='acme-free/userpics/users-md.png';'></td>" +
                                  " <td>" + userName + "</td>" +
                                  " <td>" + netspeed + "WPM</td>" +
                                   "<td>" + time1 + "</td>" +
                                   "<td>" + accuracy + "%</td>" +
                                   "<td><img src='" + rank + "' width='44' height='50'></td>" +
                                   "<td>" + (date.toLocaleTimeString("en-us", options)) + "</td>" +
                               "</tr>").insertAfter($('#tbltypingusers tbody tr:first-child'));





                    },
                    error: function (jqXHR, exception) {
                        var msg = '';
                        if (jqXHR.status === 0) {
                            msg = 'Not connect.\n Verify Network.';
                        } else if (jqXHR.status == 404) {
                            msg = 'Requested page not found. [404]';
                        } else if (jqXHR.status == 500) {
                            msg = 'Internal Server Error [500].';
                        } else if (exception === 'parsererror') {
                            msg = 'Requested JSON parse failed.';
                        } else if (exception === 'timeout') {
                            msg = 'Time out error.';
                        } else if (exception === 'abort') {
                            msg = 'Ajax request aborted.';
                        } else {
                            msg = 'Uncaught Error.\n' + jqXHR.responseText;
                        }
                        $('#lblQuestionComplete').html(msg);
                    }
                })
               

            });
            $("#btntypingtestFinish").click(function () {
                $(".modal").modal('show');
                $(".modal #txtusername").focus();
               
                var username = $("#txtusername").val();
              // alert(username);

                totaltesttimeduration = TypingTest.Timer.Duration;
                TypingTest.Timer.TimerInstance = clearInterval(TypingTest.Timer.TimerInstance);
                TypingTest.Timer.Duration = 0;
                //TypingTest.Timer.TimerInstance = 
                //clearInterval(TypingTest.Timer.TimerInstance);
                //TimerInstance: undefined;
                $('.progress-bar').css('width', + '0%').attr('aria-valuenow', 0);
                $('.progress-bar').text('0%')

                hideall();
               
                grosssp = $("#Grwpm").text().match(/\d+/);
                netspeed = $("#wpm").text().match(/\d+/);
                accuracy = $("#accuracy").text().match(/\d+/);
                if ($("#Grwpm").text() == "" || $("#wpm").text() == "" || $("#accuracy").text() == "")
                {
                    hideall();
                    $("#divTypingSelectTest").show();
                    $(".modal").modal('hide');
                    return false;
                }
                grosssp = grosssp[0];
                netspeed = netspeed[0];
                accuracy = accuracy[0];
                if (netspeed >= 1 && netspeed <= 10) {
                    rank = "acme-free/Medals/Fail.jpg";
                    rankName = "F";

                }
                else
                    if (netspeed >= 11 && netspeed <= 15) {
                        rank = "acme-free/Medals/goodtry.jpg";
                        rankName = "E";
                    }
                    else
                        if (netspeed >= 16 && netspeed <= 20) {
                            rank = "acme-free/Medals/goodtry.jpg";
                            rankName = "D";
                        }
                        else if (netspeed >= 21 && netspeed <= 25) {
                            rank = "acme-free/Medals/iron.jpg";
                            rankName = "C-";

                        }
                        else if (netspeed >= 26 && netspeed <= 30) {
                            rank = "acme-free/Medals/tin1.JPG";
                            rankName = "C";
                        }
                        else if (netspeed >= 31 && netspeed <= 35) {
                            rank = "acme-free/Medals/copper.jpg";
                            rankName = "C+";
                        }
                        else if (netspeed >= 36 && netspeed <= 40) {
                            rank = "acme-free/Medals/bronze.png";
                            rankName = "B-";
                        }
                        else if (netspeed >= 41 && netspeed <= 45) {
                            rank = "acme-free/Medals/bronze.png";
                            rankName = "B";
                        }
                        else if (netspeed >= 46 && netspeed <= 50) {
                            rank = "acme-free/Medals/silver2.jpg";
                            rankName = "B+";
                        }
                        else if (netspeed >= 51 && netspeed <= 55) {
                            rank = "acme-free/Medals/Gold1.jpg";
                            rankName = "A-";
                        }
                        else if (netspeed >= 56 && netspeed <= 60) {
                            rank = "acme-free/Medals/best.jpg";
                            rankName = "A";
                        }
                        else if (netspeed >= 61) {
                            rank = "acme-free/Medals/Trophy.jpg";
                            rankName = "A+";
                        }

                $("#lbltypingRank").text(rankName);
                $("#spell-here").text("");
                totallen = 0;
                i = 0;
                word1 = [];
                word2 = "";
                newHTML = "";
                newHTML2 = "";
                prepara = "";
                alltypepara = $("#prepara").text();
                mynew = [];
                count;
                mytotalparagraphs = 1;
                mytotalwordswrittencount = 0;
                mytotalwordswrittencount = 0;

                $("#prepara").text("");
                $("#word-to-spell").val("");
                $("#spell-here").text("");
                $("#divTypingSelectTest").show();
                $("#divTypingTestLists").show();
                // Automatically add a first row of data
                time1 = totaltesttimeduration.toString().toHHMMSS();
                time2 = userdeclaredtime.toString().toHHMMSS();
                totTime = totaltesttimeduration + userdeclaredtime;
                totTime = totTime.toString().toHHMMSS();

                // //debugger;
                //filetext_userpic = $("#myimg").attr("src");
                //if (filetext_userpic) {
                //    filetext_userpic = filetext_userpic.replace(/^data:image\/(png|jpg);base64,/, "");
                //    $("#myimg").removeAttr("src");
                //    resizeBase64Img(filetext_userpic, 50, 50).then(function (newImg) {
                //        // $('#testimg').html(newImg);
                //    });
                //    filetext_userpic = $("#myimg").attr("src");
                //    filetext_userpic = filetext_userpic.replace(/^data:image\/(png|jpg);base64,/, "");
                //}
                //else {
                //    filetext_userpic = "";
                //    filetext_userpic = "";
                //}

               
               // alert(username);
                
                
            })




            //$("#upload_link_userpic").on('click', function (e) {
            //    e.preventDefault();
            //    $("#uploadtypingtest_userpic:hidden").trigger('click');

            //});

            $("#btnSaveTyping").click(function (e) {
                // Automatically add a first row of data
                var time1 = totaltesttimeduration.toString().toHHMMSS();
                var time2 = userdeclaredtime.toString().toHHMMSS();
                var totTime = totaltesttimeduration + userdeclaredtime;
                totTime = totTime.toString().toHHMMSS();

                // //debugger;
                filetext_userpic = $("#myimg").attr("src");
                if (filetext_userpic) {
                    filetext_userpic = filetext_userpic.replace(/^data:image\/(png|jpg);base64,/, "");
                    $("#myimg").removeAttr("src");
                    resizeBase64Img(filetext_userpic, 50, 50).then(function (newImg) {
                        // $('#testimg').html(newImg);
                    });
                    filetext_userpic = $("#myimg").attr("src");
                    filetext_userpic = filetext_userpic.replace(/^data:image\/(png|jpg);base64,/, "");
                }
                else {
                    filetext_userpic = "";
                    filetext_userpic = "";
                }

                var username = $("#txtusername").val();
                var skillsSelect = document.getElementById("ddltypingtext");
                var selectedText = skillsSelect.options[skillsSelect.selectedIndex].text;



                $.ajax({
                    type: "POST",
                    url: "typing.aspx/UploadUserPicFiles",
                    contentType: 'application/json; charset=utf-8',
                    complete: function () { },
                    beforeSend: function () { },
                    timeout: 90000, //
                    data: "{'totalchars':'" + totalchars + "','totalcharscorrect':'" + totalcharscorrect + "','GrossSpeed':'" + grosssp + "','NetSpeed':'" + netspeed + "','Accuracy':'" + accuracy + "','username':'" + username + "','TestName':'" + selectedText + "','userFinishTime':'" + time1 + "','totaluserdeclaredtime':'" + totTime + "','totalcharsincorrect':'" + totalcharsincorrect + "','filename':'" + filename_userpic + "','text':'" + filetext_userpic + "'}",
                    timeout: 90000,
                    dataType: "json",
                    success: function (data) {

                        //$("#lbltypingRank").val(rankName);
                        var date = new Date();
                        var options = {
                            weekday: "long", year: "numeric", month: "short",
                            day: "numeric", hour: "2-digit", minute: "2-digit"
                        };


                        var mypicpath = "";
                        //  console.log("filename_userpic  " + filename_userpic); 
                        if (filename_userpic == "") {
                            mypicpath = "users-md.png";
                        }
                        else {
                            mypicpath = data.d;
                        }

                        // if (data.d == "users-md.png")
                        // {

                        //}
                        //  else {
                        var ids = data.d.match(/\d+/);
                        //   }


                        var totals = mytable.rows().count();
                        totals = totals++;
                        // console.log('total entries = ' + mytable.rows().count());
                        // console.log("userid " + ids[0]);
                        $("#txtUserId").val(ids[0]);
                        $("#divprinttest").show();
                        $("#divTypingTestLists").hide();
                        $("<tr role='row'><td>" + totals + "</td><td class='sorting_1'><img src='acme-free/userpics/" + mypicpath + "' width='44' height='44' onError='this.onerror=null;this.src='acme-free/userpics/users-md.png';'></td>" +
                                  " <td>" + username + "</td>" +
                                  " <td>" + netspeed + "WPM</td>" +
                                   "<td>" + time1 + "</td>" +
                                   "<td>" + accuracy + "%</td>" +
                                   "<td><img src='" + rank + "' width='44' height='50'></td>" +
                                   "<td>" + (date.toLocaleTimeString("en-us", options)) + "</td>" +
                               "</tr>").insertAfter($('#tbltypingusers tbody tr:first-child'));





                    },
                    error: function (jqXHR, exception) {
                        var msg = '';
                        if (jqXHR.status === 0) {
                            msg = 'Not connect.\n Verify Network.';
                        } else if (jqXHR.status == 404) {
                            msg = 'Requested page not found. [404]';
                        } else if (jqXHR.status == 500) {
                            msg = 'Internal Server Error [500].';
                        } else if (exception === 'parsererror') {
                            msg = 'Requested JSON parse failed.';
                        } else if (exception === 'timeout') {
                            msg = 'Time out error.';
                        } else if (exception === 'abort') {
                            msg = 'Ajax request aborted.';
                        } else {
                            msg = 'Uncaught Error.\n' + jqXHR.responseText;
                        }
                        $('#lblQuestionComplete').html(msg);
                    }
                })
            })



        })

    </script>
    <style>
        div.editable {
            /* width: 300px;
            height: 200px;*/
            border: 1px solid #ccc;
            padding: 5px;
            font-size: 18px;
            overflow-wrap: break-word;
            /* margin-left:400px;*/
            word-wrap: break-word;
            -ms-word-break: break-all;
            /* This is the dangerous one in WebKit, as it breaks things wherever */
            word-break: break-all;
            /* Instead use this non-standard one: */
            word-break: break-word;
            /* Adds a hyphen where the word breaks, if supported (No Blink) */
            -ms-hyphens: auto;
            -moz-hyphens: auto;
            -webkit-hyphens: auto;
            hyphens: auto;
        }

        .correct {
            font-size: 18px;
            color: #0f9a0f;
        }

        .wrong {
            color: red;
        }

        .written {
            color: lightgreen;
            font-size: 18px;
            overflow-wrap: break-word;
            word-wrap: break-word;
            -ms-word-break: break-all;
            /* This is the dangerous one in WebKit, as it breaks things wherever */
            word-break: break-all;
            /* Instead use this non-standard one: */
            word-break: break-word;
            /* Adds a hyphen where the word breaks, if supported (No Blink) */
            -ms-hyphens: auto;
            -moz-hyphens: auto;
            -webkit-hyphens: auto;
            hyphens: auto;
        }

        .mysimp {
            font-size: 18px;
        }

        .breakupwords {
            overflow-wrap: break-word;
            /*margin-left:203px;*/
            word-wrap: break-word;
            overflow: hidden;
            -ms-word-break: break-all;
            /* This is the dangerous one in WebKit, as it breaks things wherever */
            word-break: break-all;
            /* Instead use this non-standard one: */
            word-break: break-word;
            /* Adds a hyphen where the word breaks, if supported (No Blink) */
            -ms-hyphens: auto;
            -moz-hyphens: auto;
            -webkit-hyphens: auto;
            hyphens: auto;
        }

        .myfristletter::first-letter {
            color: blue;
            text-decoration: underline;
        }

        @media (min-width: 1200px) {
            .container {
                max-width: 810px;
                background-color: honeydew;
            }
        }

        #uploadtypingtest {
            display: none;
        }

        #uploadtypingtest_userpic {
            display: none;
        }

        .countingstyle {
            font-size: 51px;
            font-weight: 900;
            font-family: fantasy;
            color: lightgreen;
        }

        .verticalLine {
            border-left: thin solid #90ee90;
        }

        .test {
            height: 100px;
            width: 0px;
            position: relative;
            border-left: 1px solid gray;
        }

        .top-buffer {
        }

        select {
            text-transform: lowercase;
        }

        option::first-letter {
            text-transform: uppercase; /* change first letter to uppercase */
        }

        td.highlightred {
            font-weight: bold;
            color: darkred;
        }

        td.highlightyello {
            font-weight: bold;
            color: darkgreen;
        }

        td.highlightredgreen {
            font-weight: bold;
            color: darkblue;
        }


        body {
            background-color: ivory;
        }

        #canvas {
            border: 1px solid red;
            margin: 0 auto;
        }

        @media print {
            body * {
                visibility: hidden;
            }

            #printdiv {
                visibility: visible;
            }

            #printdiv {
            }
        }

        img {
            padding: 1px;
            border: 1px solid #021a40;
            background-color: #dfe8de;
        }

        input[type="file"] {
            display: none;
        }

        .custom-file-upload {
            border: 1px solid #ccc;
            display: inline-block;
            padding: 6px 12px;
            cursor: pointer;
        }
    </style>
</head>
<body style="background-color: aliceblue;">
    <form id="form1" runat="server" class="form-horizontal">
        <div class="wrapper">
            <div class="pie spinner"></div>
            <div class="pie filler"></div>
            <div class="mask"></div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <img src="acme-free/img/users-md.png" style="display: none;" id="defaultuserimg" />
            </div>
        </div>

        <div id="divTypingTest" class="container" style="display: block;">


            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="row">
                        <%--<div class="col-lg-2">

                     </div>--%>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 breakupwords" style="font-family: sans-serif;" id="mydata_para">
                            <p id="prepara" class="breakupwords" style="font-size: 18px; font-family: sans-serif;"></p>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="background-color: #a0dc82; height: 256px;">
                            <div class="spinner-wrapper">
                                <h3>Time</h3>
                                <div class="timer" style="font-size: larger;"></div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style="border-color: #a8ecad;" />
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <div class="row" style="margin-left: 5px;">
                            <%--<div class="col-lg-2"></div>--%>
                            <div spellcheck="false" class="editable breakupwords col-lg-7" style="line-height: 20px; background-color: white;" id='spell-here' contenteditable="true"></div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6" style="background-color: #a0dc82; height: 256px;">
                                <br />
                                <%--<label>Gross Speed:<span id='Grwpm'></span>   (WPM)</label> <br />
                    <label>Accuracy:<span id='accuracy'></span>  </label> <br />
                    <label>Net Speed:<span id='wpm'></span> (WPM)</label>--%>
                                <br />
                                <br />
                                <br />
                                <br />
                                <input type="button" value="Finish" class="btn btn-success " id="btntypingtestFinish" />
                                <input type="button" value="Cancel" class="btn btn-danger " id="btntypingtestCancel" />


                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2  col-md-2 col-sm-2 col-xs-2">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="text-align: right;">
                </div>
            </div>
        </div>
        <div id="divTypingSelectTest">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                    <div class="row">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                            <label style="color: green; font-size: 25px; font-family: initial; font-weight: 100;">Typing Test</label>

                        </div>

                    </div>


                    <div class="row">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 " style="border-right: 1px solid lightgreen;">
                            <label class="countingstyle">1</label>

                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">

                            <div class="row">
                                <div class="col-md-6 col-md-6 col-sm-6 col-xs-6">
                                    <label style="font-size: 17px;"><b>Test Te<u>x</u>t</b></label>
                                </div>
                                <div class="col-md-2 col-md-2 col-sm-2 col-xs-2">
                                    <input id="uploadtypingtest" type="file" />
                                    <a href="#" id="upload_link" class="glyphicon glyphicon-play"><u><b>Add</b></u></a>​
                                </div>
                            </div>

                            <asp:HiddenField ID="myselParabyuser" runat="server" />

                            <select id="ddltypingtext" size="10" class="dropdown" style="font-size: 16px;" runat="server">
                            </select>





                        </div>
                    </div>

                    <div class="row top-buffer">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                        <div class="col-lg-1  col-md-1 col-sm-1 col-xs-1" style="border-right: 1px solid lightgreen;">

                            <label class="countingstyle">2</label>

                        </div>
                        <div class="col-lg-3  col-md-3 col-sm-3 col-xs-3">

                            <label style="font-size: 17px;"><b><u>D</u>uration</b></label>

                            <br />

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <select style="width: 200px; float: left;" onchange="this.nextElementSibling.value=this.value">
                                        <option>Free</option>
                                        <option selected="selected">2 min.</option>
                                        <option>5 min.</option>
                                        <option>10 min.</option>
                                        <option>20 min.</option>
                                        <option>30 min.</option>
                                    </select>
                                    <input id="typingtime" style="height: 18px; width: 185px; margin-left: 1px; margin-top: -19px; border: none; float: left;" value="2 min." />
                                </div>
                            </div>

                            <br />

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-1  col-md-1 col-sm-1 col-xs-1"></div>
                        <div class="col-lg-1  col-md-1 col-sm-1 col-xs-1" style="border-right: 1px solid lightgreen;">

                            <label class="countingstyle">3</label>

                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
                            <label style="font-size: 17px;"><b>Clic<u>k</u></b></label>

                            <input type="button" class="btn btn-default btn-lg btn-block" id="btnStartTypingTest" value="Start Test" />

                        </div>
                    </div>
                    <div id="divTypingTestLists" style="background-color: rgba(94, 251, 66, 0.38);">

                        <div class="row">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                                    <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
                                        <label style="font-size: 17px;"><b>Exercise C<u>o</u>mpleted Detail </b></label>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="text-align: right;">
                                            <label>Time Used:</label>

                                        </div>
                                        <div class="col-lg-1  col-md-1 col-sm-1 col-xs-1">
                                            <span id='totaltimeconsumed'></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="text-align: right;">
                                            <label style="font-size: 11px;">Gross Speed:</label>

                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            <span id='Grwpm'></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="text-align: right;">
                                            <label>Accuracy:</label>

                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            <span id='accuracy'></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="text-align: right;">
                                            <label>Net Speed:</label>

                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            <span id='wpm'></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="text-align: right;">
                                            <label>Grade:</label>

                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            <span id='lbltypingRank'></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="text-align: right;">
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            <button type="button" id="btntypinglike" class="btn btn-link glyphicon glyphicon-bell">Like</button>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"></div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        </div>
                                        <div class=" col-md-1 col-sm-1 col-xs-1 col-lg-1">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"></div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                            <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">Enter your name please ...</div>
                <div class="modal-body">
                    <input type="text" id="txtusername"></input>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">OK</button>
                </div>
            </div>
        </div>
    </div>
                                          
                                            <!-- /.modal -->
                                           
                                          
                                           <%-- <label for="uploadtypingtest_userpic" class="custom-file-upload">
                                                <i class="glyphicon glyphicon-cloud-upload"></i>Picture.
                                            </label>--%>
                                            <img src="acme-free/img/users-md.png" height="50" width="50" id="myimg" />
                                            <div id="testimg">
                                            </div>
                                           <%-- <input id="uploadtypingtest_userpic" type="file" onchange="readFile(this)" />--%>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"></div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">

                                            <%-- <label><u><b>Add Picture</b></u></label>--%>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-2 col-sm-2 col-xs-2">
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                            <input type="button" id="btnSaveTyping" class="btn btn-lg btn-success" value="Save Your Record" />


                                            <input type="text" value="1" id="txtUserId" hidden="hidden" runat="server" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-1  col-md-1 col-sm-1 col-xs-1"></div>
                            </div>


                        </div>
                    </div>
                    <div id="divprinttest">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            </div>
                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                <asp:LinkButton runat="server" ID="btnPrintTypingcert" OnClick="btnPrintTypingcert_Click" CssClass="glyphicon glyphicon-play">Print Your Certificate</asp:LinkButton>
                            </div>
                            <div class="col-lg-1  col-md-1 col-sm-1 col-xs-1">
                            </div>
                            <div class="col-lg-2  col-md-2 col-sm-2 col-xs-2">
                                <button type="button" class="btn btn-link glyphicon glyphicon-bell">Like</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7  col-md-7 col-sm-7 col-xs-7">
                    <div class="row">
                        <div class="col-lg-11  col-md-11 col-sm-11 col-xs-11">

                            <table class="table" id="tbltypingusers">
                                <thead>
                                    <tr>
                                        <th>Sr.No.</th>
                                        <th>Pic</th>
                                        <th>Name</th>
                                        <th>NET WPM</th>
                                        <th>Time Used</th>
                                        <th>Accuracy</th>
                                        <th>Rank</th>
                                        <th>Date</th>
                                        <th>wpm</th>
                                    </tr>
                                </thead>

                            </table>
                        </div>
                    </div>

                </div>
            </div>



        </div>

        <input id='word-to-spell' class="breakupwords" type='hidden' value="" />


        <div id="updatediv"></div>
        <%--<textarea id='spell-here' style="border: none;
    width: 350px;"></textarea>--%>
        <hr />


    </form>
</body>
</html>
