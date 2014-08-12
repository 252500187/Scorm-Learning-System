var Calendar = function () {


    return {
        //main function to initiate the module
        init: function (result) {
            Calendar.initCalendar(result);
        },

        initCalendar: function (result) {

            if (!jQuery().fullCalendar) {
                return;
            }
            var date = new Date();
            var d;     //日
            var m;     //月
            var y;     //年
            var h = {};

            if (Metronic.isRTL()) {
                if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                        right: 'title, prev, next',
                        center: '',
                        right: 'agendaDay, agendaWeek, month, today'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        right: 'title',
                        center: '',
                        left: 'agendaDay, agendaWeek, month, today, prev,next'
                    };
                }
            } else {
                if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                        left: 'title, prev, next',
                        center: '',
                        right: 'today,month,agendaWeek,agendaDay'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        left: 'title',
                        center: '',
                        right: 'prev,next,today,month,agendaWeek,agendaDay'
                    };
                }
            }

            var initDrag = function (el) {
                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim(el.text()) // use the element's text as the event title
                };
                // store the Event Object in the DOM element so we can get to it later
                el.data('eventObject', eventObject);
                // make the event draggable using jQuery UI
                el.draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });
            }

            var addEvent = function (title) {
                title = title.length == 0 ? "Untitled Event" : title;
                var html = $('<div class="external-event label label-default">' + title + '</div>');
                jQuery('#event_box').append(html);
                initDrag(html);
            }

            $('#external-events div.external-event').each(function () {
                initDrag($(this))
            });

            $('#event_add').unbind('click').click(function () {
                var title = $('#event_title').val();
                addEvent(title);
            });

            //predefined events
            $('#event_box').html("");
            for (var i = 0; i < result.length; i++) {
                addEvent(result[i].scormName);
            }

            $('#calendar').fullCalendar('destroy'); // destroy the calendar
            $('#calendar').fullCalendar({ //re-initialize the calendar
                header: h,
                slotMinutes: 15,
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar !!!
                drop: function (date, allDay) { // this function is called when something is dropped
                    y = date.getFullYear();
                    m = date.getMonth()+1;
                    m = m<10 ? ("0"+m) : m;
                    d = date.getDate();
                    d = d < 10 ? ("0" + d) : d;
                    alert(y+","+m+","+d);
                    var resultDate = y + "-" + m + "-" + d;
                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');
                    // we need to copy it, so that multiple events don't have a reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);

                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    copiedEventObject.allDay = allDay;
                    copiedEventObject.className = $(this).attr("data-class");

                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
                    $.ajax({
                        url: basePath + "user/center/addCalendarEvents",
                        dataType: "json",
                        type: "post",
                        data: {
                            title: copiedEventObject.title,
                            start: resultDate,
                            end: resultDate
                        },
                        success: function () {
                            alert("添加日程成功！");
                        },
                        error: doError
                    });
                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }
                },
//                eventDrop: function (event, delta, revertFunc) {
//                    d = parseInt(d) + delta;
//                    var resultDate = y + "-" + m + "-" + d;
//                    $.ajax({
//                        url: basePath + "user/center/changeCalendarEvents",
//                        dataType: "json",
//                        type: "post",
//                        data: {
//                            id: event.id,
//                            title: event.title,
//                            start: resultDate,
//                            end: resultDate
//                        },
//                        success: function () {
//                            alert("改")
//                        },
//                        error: doError
//                    });
//                },
                events: function (start, end, callback) {
                    $.ajax({
                        url: basePath + "user/center/getCalendarEvents",
                        dataType: "json",
                        type: "POST",
                        success: function (list) {
                            var events = [];
                            for (var i = 0; i < list.length; i++) {
                                var title = list[i].title;
                                var start = new Date(list[i].start);
                                events.push({
                                    title: title,
                                    start: start
                                })
                            }
                            callback(events);
                        }
                    });
                }
            });
        }
    };
}();