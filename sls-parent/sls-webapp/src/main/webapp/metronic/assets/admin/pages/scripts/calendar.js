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
                    title: $.trim(el.text()), // use the element's text as the event title
                    scormId: el.find("input").val()
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

            var addEvent = function (scorm) {
//                title = title.length == 0 ? "Untitled Event" : title;
//                var html = $('<div class="external-event label label-default alert alert-info display-hide">' +
//                    '<button type="hidden" class="close" data-close="alert">' + title + '</button></div>');
                var html = $('<div class="external-event label label-default"><h4>'+scorm.scormName+'</h4><input type="hidden" value="'+scorm.scormId+'" /></div>');
                jQuery('#event_box').append(html);
                initDrag(html);
            }

            $('#external-events div.external-event').each(function () {
                initDrag($(this))
            });

//            $('#event_add').unbind('click').click(function () {
//                var title = $('#event_title').val();
//                addEvent(title);
//            });

            //predefined events
            $('#event_box').html("");
            for (var i = 0; i < result.length; i++) {
                addEvent(result[i]);
            }

            $('#calendar').fullCalendar('destroy'); // destroy the calendar
            $('#calendar').fullCalendar({ //re-initialize the calendar
                header: h,
                slotMinutes: 15,
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar !!!
                drop: function (date, allDay) { // this function is called when something is dropped
                    y = date.getFullYear();
                    m = date.getMonth() + 1;
                    m = m < 10 ? ("0" + m) : m;
                    d = date.getDate();
                    d = d < 10 ? ("0" + d) : d;
                    var resultDate = y + "-" + m + "-" + d;
                    var thisObj = $(this);
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
                    $.ajax({
                        url: basePath + "user/center/addCalendarEvents",
                        dataType: "json",
                        type: "post",
                        data: {
                            scormId: copiedEventObject.scormId,
                            startDate: resultDate,
                            endDate: resultDate
                        },
                        success: function (calendarId) {
                            copiedEventObject.calendarId = calendarId;
                            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
                            location.reload();
                        },
                        error: doError
                    });
                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        thisObj.remove();
                    }
                },
                events: function (start, end, callback) {
                    $.ajax({
                        url: basePath + "user/center/getCalendarEvents",
                        dataType: "json",
                        type: "POST",
                        success: function (list) {
                            var events = [];
                            for (var i = 0; i < list.length; i++) {
                                events.push({
                                    id: list[i].calendarId,
                                    title: list[i].scormName,
                                    start: new Date(list[i].startDate),
                                    end: new Date(list[i].endDate)
                                })
                            }
                            callback(events);
                        }
                    });
                },
                eventClick: function (event) {
                    $.ajax({
                        url: basePath + "user/center/delCalendarEvent?calendarId=" + event.id,
                        dataType: "json",
                        type: "post",
                        success: function () {
                            $("#calendar").fullCalendar("removeEvents", event.id);
                        },
                        error: doError
                    });
                }
            });
        }
    };
}();