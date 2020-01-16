<%--
  Created by IntelliJ IDEA.
  User: Hyuck
  Date: 2019-08-26
  Time: 오후 7:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
	#calendar {
		margin: 0 auto;
		width: 900px;
	}
</style>

<%-- Page Heading --%>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
	<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
</div>

<%-- Content Row --%>
<div class="row">

	<%-- Calendar --%>
	<div class="col-xl-12 col-lg-7">
		<div class="card shadow mb-4">
			<%-- Card Header - Dropdown --%>
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">예약 현황</h6>
			</div>
			<%-- Card Body --%>
			<div class="card-body">
				<div class="wrap">
					<div id='calendar'></div>
				</div>
			</div>
		</div>
	</div>

</div>

<script>
	document.addEventListener('DOMContentLoaded', function() {

		const calendarEl = document.getElementById('calendar');
		let calendar = new FullCalendar.Calendar(calendarEl, {
			plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectMirror: true,
			eventTextColor: "#FFF",
			select: function (arg) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.addEvent({
						title: title,
						start: arg.start,
						end: arg.end,
						allDay: arg.allDay
					})
				}
				calendar.unselect()
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2019-08-01'
				},
				{
					title: 'Long Event',
					start: '2019-08-07',
					end: '2019-08-10'
				},
				{
					groupId: 999,
					title: 'Repeating Event',
					start: '2019-08-09T16:00:00'
				},
				{
					groupId: 999,
					title: 'Repeating Event',
					start: '2019-08-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2019-08-11',
					end: '2019-08-13'
				},
				{
					title: 'Meeting',
					start: '2019-08-12T10:30:00',
					end: '2019-08-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2019-08-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2019-08-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2019-08-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2019-08-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2019-08-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2019-08-28'
				}
			]
		});
		calendar.render();

	});
</script>